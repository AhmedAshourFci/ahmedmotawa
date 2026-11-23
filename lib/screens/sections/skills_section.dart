import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../l10n/app_localizations.dart';
import '../../models/models.dart';
import '../../utils/app_data.dart';
import '../../widgets/animated_widgets.dart';
import '../../widgets/section_widgets.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final categories = <String, List<SkillModel>>{};
    for (final skill in AppData.skills) {
      categories.putIfAbsent(skill.categoryKey, () => []).add(skill);
    }

    return SectionContainer(
      child: Column(
        children: [
          SectionHeader(title: l10n.skillsTitle, subtitle: l10n.skillsSubtitle),
          const SizedBox(height: 48),
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: categories.entries.map((entry) {
              return _SkillCategoryCard(
                title: skillCategoryLabel(l10n, entry.key),
                skills: entry.value,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class _SkillCategoryCard extends StatelessWidget {
  final String title;
  final List<SkillModel> skills;

  const _SkillCategoryCard({required this.title, required this.skills});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: SurfaceCard(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CardTitle(icon: Icons.folder_open, title: title),
            const SizedBox(height: 20),
            ...skills.map(
              (skill) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: SkillProgressBar(
                  progress: skill.proficiency,
                  label: skill.name,
                  icon: skill.icon,
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 450.ms);
  }
}
