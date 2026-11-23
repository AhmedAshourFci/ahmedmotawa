import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../../l10n/app_localizations.dart';
import '../../utils/app_data.dart';
import '../../utils/app_theme.dart';
import '../../widgets/section_widgets.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;

    return SectionContainer(
      child: Column(
        children: [
          SectionHeader(title: l10n.aboutTitle),
          const SizedBox(height: 48),
          isDesktop
              ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildInfoCard(context, l10n)),
                    const SizedBox(width: 24),
                    Expanded(child: _buildDetailsCard(context, l10n)),
                  ],
                )
              : Column(
                  children: [
                    _buildInfoCard(context, l10n),
                    const SizedBox(height: 20),
                    _buildDetailsCard(context, l10n),
                  ],
                ),
        ],
      ),
    );
  }

  Widget _buildInfoCard(BuildContext context, AppLocalizations l10n) {
    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTitle(icon: Icons.person_outline, title: l10n.aboutWho),
          const SizedBox(height: 20),
          Text(l10n.aboutBody1, style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 14),
          Text(l10n.aboutBody2, style: Theme.of(context).textTheme.bodyLarge),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms);
  }

  Widget _buildDetailsCard(BuildContext context, AppLocalizations l10n) {
    final locale = Localizations.localeOf(context);
    return SurfaceCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardTitle(icon: Icons.info_outline, title: l10n.personalInfo),
          const SizedBox(height: 20),
          _buildInfoRow(Icons.person_outline, l10n.labelName, AppData.name.of(locale)),
          _buildInfoRow(Icons.school_outlined, l10n.labelDegree, AppData.degreeShort.of(locale)),
          _buildInfoRow(Icons.account_balance_outlined, l10n.labelUniversity, AppData.universityShort.of(locale)),
          _buildInfoRow(Icons.location_on_outlined, l10n.labelLocation, AppData.location.of(locale)),
          _buildInfoRow(Icons.email_outlined, l10n.labelEmail, AppData.email),
          _buildInfoRow(Icons.phone_outlined, l10n.labelPhone, AppData.phone),
          const SizedBox(height: 8),
          Text(l10n.languages, style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 12),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              _chip(l10n.langArabic),
              _chip(l10n.langEnglish),
            ],
          ),
        ],
      ),
    ).animate().fadeIn(duration: 500.ms, delay: 80.ms);
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        children: [
          Icon(icon, size: 20, color: AppColors.accent),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: const TextStyle(color: AppColors.textMuted, fontSize: 12),
                ),
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
        ],
      ),
    );
  }

  Widget _chip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: AppColors.accent.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.accent.withValues(alpha: 0.2)),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: AppColors.accent,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
