import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/app_localizations.dart';
import '../../utils/app_data.dart';
import '../../utils/app_theme.dart';
import '../../widgets/section_widgets.dart';

class ContactSection extends StatefulWidget {
  const ContactSection({super.key});

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _send() async {
    final l10n = AppLocalizations.of(context);
    final name = _nameController.text.trim();
    final email = _emailController.text.trim();
    final subject = _subjectController.text.trim();
    final message = _messageController.text.trim();

    if (name.isEmpty || email.isEmpty || subject.isEmpty || message.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.formIncomplete)),
      );
      return;
    }
    if (!email.contains('@')) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.formInvalidEmail)),
      );
      return;
    }

    final body = '$message\n\n$name\n$email';
    final uri = Uri(
      scheme: 'mailto',
      path: AppData.email,
      queryParameters: {
        'subject': subject,
        'body': body,
      },
    );
    await launchUrl(uri);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;

    return SectionContainer(
      child: Column(
        children: [
          SectionHeader(
            title: l10n.contactTitle,
            subtitle: l10n.contactSubtitle,
          ),
          const SizedBox(height: 48),
          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildContactInfo(l10n)),
                    const SizedBox(width: 24),
                    Expanded(child: _buildContactForm(l10n)),
                  ],
                )
              : Column(
                  children: [
                    _buildContactInfo(l10n),
                    const SizedBox(height: 20),
                    _buildContactForm(l10n),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(AppLocalizations l10n) {
    final locale = Localizations.localeOf(context);
    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTitle(icon: Icons.contact_mail_outlined, title: l10n.contactInfo),
          const SizedBox(height: 24),
          ...AppData.contacts.map((contact) {
            final value = contact.typeKey == 'location'
                ? AppData.location.of(locale)
                : contact.value;
            return _ContactItem(
              icon: contact.icon,
              type: contactTypeLabel(l10n, contact.typeKey),
              value: value,
              url: contact.url,
            );
          }),
          const SizedBox(height: 12),
          Text(l10n.followMe, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: 16),
          Row(
            children: [
              _social(FontAwesomeIcons.whatsapp, 'https://wa.me/${AppData.whatsappPhone}'),
              _social(FontAwesomeIcons.envelope, 'mailto:${AppData.email}'),
              _social(FontAwesomeIcons.phone, 'tel:${AppData.phone}'),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 450.ms);
  }

  Widget _social(IconData icon, String url) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 12),
      child: InkWell(
        onTap: () => launchUrl(Uri.parse(url)),
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: AppColors.cardBgLight,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.glassBorder),
          ),
          child: Icon(icon, size: 18, color: AppColors.accent),
        ),
      ),
    );
  }

  Widget _buildContactForm(AppLocalizations l10n) {
    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTitle(icon: Icons.send_outlined, title: l10n.sendMessage),
          const SizedBox(height: 24),
          _field(_nameController, l10n.fieldName, Icons.person_outline),
          const SizedBox(height: 14),
          _field(_emailController, l10n.fieldEmail, Icons.email_outlined),
          const SizedBox(height: 14),
          _field(_subjectController, l10n.fieldSubject, Icons.subject),
          const SizedBox(height: 14),
          _field(
            _messageController,
            l10n.fieldMessage,
            Icons.message_outlined,
            maxLines: 4,
          ),
          const SizedBox(height: 22),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: _send,
              icon: const Icon(Icons.send),
              label: Text(l10n.sendMessage),
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 18),
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 450.ms, delay: 80.ms);
  }

  Widget _field(
    TextEditingController controller,
    String hint,
    IconData icon, {
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textMuted),
        prefixIcon: Icon(icon, color: AppColors.textMuted),
        filled: true,
        fillColor: AppColors.cardBgLight,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: const BorderSide(color: AppColors.accent, width: 1.5),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      ),
    );
  }
}

class _ContactItem extends StatelessWidget {
  final IconData icon;
  final String type;
  final String value;
  final String url;

  const _ContactItem({
    required this.icon,
    required this.type,
    required this.value,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: InkWell(
        onTap: url.isNotEmpty ? () => launchUrl(Uri.parse(url)) : null,
        borderRadius: BorderRadius.circular(14),
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.cardBgLight,
            borderRadius: BorderRadius.circular(14),
            border: Border.all(color: AppColors.glassBorder),
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.accent.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(icon, color: AppColors.accent, size: 20),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      type,
                      style: const TextStyle(
                        color: AppColors.textMuted,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      value,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
              if (url.isNotEmpty)
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.accent,
                  size: 14,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
