import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../l10n/app_localizations.dart';
import '../../utils/app_data.dart';
import '../../utils/app_theme.dart';
import '../../widgets/section_widgets.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final locale = Localizations.localeOf(context);
    final experiences = AppData.experiences;
    final education = AppData.education.first;

    return SectionContainer(
      child: Column(
        children: [
          SectionHeader(
            title: l10n.experienceTitle,
            subtitle: l10n.experienceSubtitle,
          ),
          const SizedBox(height: 48),
          ...experiences.map((exp) {
            return _TimelineCard(
              title: exp.title.of(locale),
              subtitle: exp.company.of(locale),
              badge: exp.duration.of(locale),
              description: exp.description.of(locale),
              bullets: exp.achievements.map((a) => a.of(locale)).toList(),
              icon: Icons.work_outline,
            );
          }),
          const SizedBox(height: 8),
          _TimelineCard(
            title: education.degree.of(locale),
            subtitle: education.institution.of(locale),
            badge: education.year,
            description: education.project?.of(locale),
            bullets: const [],
            icon: Icons.school_outlined,
          ),
        ],
      ),
    );
  }
}

class _TimelineCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String badge;
  final String? description;
  final List<String> bullets;
  final IconData icon;

  const _TimelineCard({
    required this.title,
    required this.subtitle,
    required this.badge,
    required this.description,
    required this.bullets,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  gradient: AppGradients.accent,
                  shape: BoxShape.circle,
                  boxShadow: [AppShadows.buttonGlow],
                ),
                child: Icon(icon, size: 18, color: AppColors.primary),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: SurfaceCard(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 12,
                    runSpacing: 8,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      Text(title, style: Theme.of(context).textTheme.headlineSmall),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                        decoration: BoxDecoration(
                          color: AppColors.accent.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: AppColors.accent.withValues(alpha: 0.2),
                          ),
                        ),
                        child: Text(
                          badge,
                          style: const TextStyle(
                            color: AppColors.accent,
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          color: AppColors.accent,
                        ),
                  ),
                  if (description != null && description!.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    Text(description!, style: Theme.of(context).textTheme.bodyMedium),
                  ],
                  if (bullets.isNotEmpty) ...[
                    const SizedBox(height: 14),
                    ...bullets.map(
                      (item) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 7),
                              width: 7,
                              height: 7,
                              decoration: const BoxDecoration(
                                color: AppColors.accent,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                item,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 450.ms);
  }
}
