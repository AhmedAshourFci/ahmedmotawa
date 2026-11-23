import 'package:flutter/material.dart';
import 'dart:html' as html;
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../l10n/app_localizations.dart';
import '../../utils/app_data.dart';
import '../../utils/app_theme.dart';
import '../../widgets/animated_widgets.dart';
import '../../widgets/section_widgets.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    final height = MediaQuery.sizeOf(context).height;

    return ConstrainedBox(
      constraints: BoxConstraints(minHeight: height),
      child: SectionContainer(
        vertical: isDesktop ? 120 : 96,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            isDesktop
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(flex: 6, child: _buildContent(context)),
                      const SizedBox(width: 48),
                      Expanded(flex: 4, child: _buildProfileImage(context)),
                    ],
                  )
                : Column(
                    children: [
                      _buildProfileImage(context, size: 220),
                      const SizedBox(height: 36),
                      _buildContent(context),
                    ],
                  ),
            const SizedBox(height: 56),
            _HeroStats(),
          ],
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context);
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            color: AppColors.accent.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: AppColors.accent.withValues(alpha: 0.3)),
          ),
          child: Text(
            l10n.heroBadge,
            style: Theme.of(context).textTheme.labelLarge,
          ),
        ).animate().fadeIn(duration: 500.ms),
        const SizedBox(height: 24),
        Text(
          AppData.name.of(locale),
          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                fontSize: isDesktop ? 56 : 36,
                height: 1.15,
              ),
        ).animate().fadeIn(duration: 600.ms, delay: 120.ms),
        const SizedBox(height: 12),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: l10n.heroBeforeHighlight,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
              ),
              TextSpan(
                text: l10n.heroHighlight,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: AppColors.accent,
                      fontWeight: FontWeight.w700,
                    ),
              ),
              TextSpan(
                text: l10n.heroAfterHighlight,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: Colors.white,
                      fontWeight: FontWeight.w300,
                    ),
              ),
            ],
          ),
        ).animate().fadeIn(duration: 600.ms, delay: 220.ms),
        const SizedBox(height: 20),
        Text(
          AppData.bio.of(locale),
          style: Theme.of(context).textTheme.bodyLarge,
        ).animate().fadeIn(duration: 600.ms, delay: 320.ms),
        const SizedBox(height: 32),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: [
            ElevatedButton.icon(
              onPressed: () => launchUrl(Uri.parse('mailto:${AppData.email}')),
              icon: const Icon(Icons.email_outlined),
              label: Text(l10n.hireMe),
            ),
            OutlinedButton.icon(
              onPressed: () => launchUrl(Uri.parse('tel:${AppData.phone}')),
              icon: const Icon(Icons.phone_outlined),
              label: Text(l10n.callMe),
            ),
            OutlinedButton.icon(
              onPressed: () {
                final isArabic = locale.languageCode == 'ar';
                final fileName = isArabic
                    ? 'Ahmed_Motawa_CV_AR.pdf'
                    : 'Ahmed_Motawa_CV_EN.pdf';
                final anchor = html.AnchorElement(
                  href: 'assets/assets/cv/$fileName',
                )..download = fileName;
                anchor.click();
                anchor.remove();
              },
              icon: const Icon(Icons.download_outlined),
              label: Text(l10n.downloadCv),
            ),
          ],
        ).animate().fadeIn(duration: 600.ms, delay: 420.ms),
        const SizedBox(height: 28),
        Row(
          children: [
            _buildSocialIcon(
              FontAwesomeIcons.whatsapp,
              'https://wa.me/${AppData.whatsappPhone}',
            ),
            _buildSocialIcon(
              FontAwesomeIcons.envelope,
              'mailto:${AppData.email}',
            ),
            _buildSocialIcon(
              FontAwesomeIcons.phone,
              'tel:${AppData.phone}',
            ),
          ],
        ).animate().fadeIn(duration: 600.ms, delay: 520.ms),
      ],
    );
  }

  Widget _buildProfileImage(BuildContext context, {double size = 300}) {
    return Center(
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: AppGradients.heroGlow,
          boxShadow: [AppShadows.glow],
        ),
        child: Container(
          margin: const EdgeInsets.all(4),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,
            image: DecorationImage(
              image: AssetImage('assets/images/profile.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    ).animate().fadeIn(duration: 800.ms).scale(
          begin: const Offset(0.92, 0.92),
          duration: 800.ms,
          curve: Curves.easeOutCubic,
        );
  }

  Widget _buildSocialIcon(IconData icon, String url) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(end: 12),
      child: InkWell(
        onTap: () => launchUrl(Uri.parse(url)),
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            color: AppColors.surface,
            shape: BoxShape.circle,
            border: Border.all(color: AppColors.glassBorder),
          ),
          child: Icon(icon, size: 18, color: AppColors.accent),
        ),
      ),
    );
  }
}

class _HeroStats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    final stats = [
      (5, l10n.statYears, Icons.calendar_today_outlined),
      (10, l10n.statApps, Icons.apps_outlined),
      (15, l10n.statClients, Icons.people_outline),
      (20, l10n.statTech, Icons.code),
    ];

    final items = stats
        .map(
          (s) => _StatTile(value: s.$1, label: s.$2, icon: s.$3),
        )
        .toList();

    return SurfaceCard(
      padding: EdgeInsets.symmetric(
        horizontal: isDesktop ? 12 : 8,
        vertical: isDesktop ? 20 : 16,
      ),
      child: isDesktop
          ? Row(
              children: [
                for (var i = 0; i < items.length; i++) ...[
                  Expanded(child: items[i]),
                  if (i != items.length - 1)
                    Container(
                      width: 1,
                      height: 56,
                      color: AppColors.glassBorder,
                    ),
                ],
              ],
            )
          : Wrap(
              alignment: WrapAlignment.center,
              runSpacing: 16,
              children: items
                  .map((item) => SizedBox(width: 150, child: item))
                  .toList(),
            ),
    );
  }
}

class _StatTile extends StatelessWidget {
  final int value;
  final String label;
  final IconData icon;

  const _StatTile({
    required this.value,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icon, color: AppColors.accent, size: 20),
        const SizedBox(height: 8),
        AnimatedCounter(
          target: value,
          suffix: '+',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: AppColors.accent,
              ),
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
