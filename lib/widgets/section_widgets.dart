import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../l10n/app_localizations.dart';
import '../utils/app_theme.dart';

class SectionContainer extends StatelessWidget {
  final Widget child;
  final double vertical;

  const SectionContainer({
    super.key,
    required this.child,
    this.vertical = 88,
  });

  static EdgeInsets paddingOf(BuildContext context, {double vertical = 88}) {
    final bp = ResponsiveBreakpoints.of(context);
    final horizontal = bp.isDesktop ? 80.0 : (bp.isTablet ? 40.0 : 20.0);
    return EdgeInsets.symmetric(horizontal: horizontal, vertical: vertical);
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxWidth: 1180),
        child: Padding(
          padding: paddingOf(context, vertical: vertical),
          child: child,
        ),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.displaySmall,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 14),
        Container(
          width: 64,
          height: 4,
          decoration: BoxDecoration(
            gradient: AppGradients.accent,
            borderRadius: BorderRadius.circular(2),
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 16),
          Text(
            subtitle!,
            style: Theme.of(context).textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
      ],
    ).animate().fadeIn(duration: 500.ms).slideY(begin: 0.08, duration: 500.ms);
  }
}

class SurfaceCard extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;

  const SurfaceCard({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(28),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: AppColors.cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.glassBorder),
        boxShadow: [AppShadows.card],
      ),
      child: child,
    );
  }
}

class CardTitle extends StatelessWidget {
  final IconData icon;
  final String title;

  const CardTitle({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.accent.withValues(alpha: 0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(icon, color: AppColors.accent, size: 26),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Text(title, style: Theme.of(context).textTheme.headlineSmall),
        ),
      ],
    );
  }
}

String skillCategoryLabel(AppLocalizations l10n, String key) {
  switch (key) {
    case 'framework':
      return l10n.catFramework;
    case 'language':
      return l10n.catLanguage;
    case 'mobile':
      return l10n.catMobile;
    case 'backend':
      return l10n.catBackend;
    case 'database':
      return l10n.catDatabase;
    case 'tools':
      return l10n.catTools;
    case 'concepts':
      return l10n.catConcepts;
    default:
      return key;
  }
}

String appCategoryLabel(Locale locale, String key) {
  const en = {
    'sports': 'Sports',
    'shopping': 'Shopping',
    'social': 'Social',
    'lifestyle': 'Lifestyle',
    'business': 'Business',
    'marketplace': 'Marketplace',
    'logistics': 'Logistics',
    'automotive': 'Automotive',
  };
  const ar = {
    'sports': 'رياضة',
    'shopping': 'تسوّق',
    'social': 'اجتماعي',
    'lifestyle': 'نمط حياة',
    'business': 'أعمال',
    'marketplace': 'سوق',
    'logistics': 'لوجستيات',
    'automotive': 'سيارات',
  };
  final map = locale.languageCode == 'ar' ? ar : en;
  return map[key] ?? key;
}

String contactTypeLabel(AppLocalizations l10n, String key) {
  switch (key) {
    case 'phone':
      return l10n.contactPhone;
    case 'email':
      return l10n.contactEmail;
    case 'location':
      return l10n.contactLocation;
    default:
      return key;
  }
}
