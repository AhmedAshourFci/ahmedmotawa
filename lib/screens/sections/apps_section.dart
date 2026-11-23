import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../l10n/app_localizations.dart';
import '../../models/models.dart';
import '../../utils/app_data.dart';
import '../../utils/app_theme.dart';
import '../../widgets/section_widgets.dart';
import '../app_details_screen.dart';

class AppsSection extends StatelessWidget {
  const AppsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);

    return SectionContainer(
      child: Column(
        children: [
          SectionHeader(title: l10n.appsTitle, subtitle: l10n.appsSubtitle),
          const SizedBox(height: 44),
          LayoutBuilder(
            builder: (context, constraints) {
              final columns = constraints.maxWidth >= 900
                  ? 3
                  : (constraints.maxWidth >= 580 ? 2 : 1);
              const spacing = 20.0;
              final itemWidth =
                  (constraints.maxWidth - spacing * (columns - 1)) / columns;

              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: AppData.apps.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: columns,
                  crossAxisSpacing: spacing,
                  mainAxisSpacing: spacing,
                  mainAxisExtent: itemWidth < 360 ? 390 : 410,
                ),
                itemBuilder: (context, index) => _AppCard(
                  app: AppData.apps[index],
                  index: index,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _AppCard extends StatelessWidget {
  final AppModel app;
  final int index;

  const _AppCard({required this.app, required this.index});

  void _openDetails(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => AppDetailsScreen(app: app),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    final hasStores = app.appStoreUrl != null || app.playStoreUrl != null;

    return Material(
      color: AppColors.cardBg,
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => _openDetails(context),
        borderRadius: BorderRadius.circular(20),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: AppColors.glassBorder),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _AppArtwork(app: app),
                    PositionedDirectional(
                      top: 14,
                      start: 14,
                      child: _Badge(
                        text: appCategoryLabel(locale, app.categoryKey),
                      ),
                    ),
                    PositionedDirectional(
                      top: 14,
                      end: 14,
                      child: _Badge(text: app.year ?? ''),
                    ),
                    const PositionedDirectional(
                      bottom: 12,
                      end: 12,
                      child: DecoratedBox(
                        decoration: BoxDecoration(
                          color: Color(0xAA07101F),
                          shape: BoxShape.circle,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(9),
                          child: Icon(
                            Icons.open_in_new_rounded,
                            size: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 5,
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(18, 16, 18, 14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        app.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        app.description.of(locale),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: AppColors.textSecondary,
                              height: 1.45,
                            ),
                      ),
                      const Spacer(),
                      Wrap(
                        spacing: 7,
                        runSpacing: 7,
                        children: [
                          for (final technology in app.technologies.take(3))
                            _TechnologyChip(label: technology),
                          if (app.technologies.length > 3)
                            _TechnologyChip(
                              label: '+${app.technologies.length - 3}',
                            ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Icon(
                            hasStores ? Icons.storefront_outlined : Icons.info_outline,
                            color: AppColors.accent,
                            size: 17,
                          ),
                          const SizedBox(width: 7),
                          Expanded(
                            child: Text(
                              hasStores
                                  ? (isArabic ? 'متوفر في المتجر' : 'Available in store')
                                  : (isArabic ? 'عرض تفاصيل التطبيق' : 'Explore the app'),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: Theme.of(context).textTheme.labelMedium?.copyWith(
                                    color: AppColors.accentLight,
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                          ),
                          Icon(
                            isArabic
                                ? Icons.arrow_back_rounded
                                : Icons.arrow_forward_rounded,
                            color: AppColors.accent,
                            size: 18,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(duration: 450.ms, delay: (index * 90).ms).slideY(
          begin: 0.05,
          duration: 450.ms,
          delay: (index * 90).ms,
        );
  }
}

class _AppArtwork extends StatelessWidget {
  final AppModel app;

  const _AppArtwork({required this.app});

  @override
  Widget build(BuildContext context) {
    final image = app.screenshots.isEmpty ? null : app.screenshots.first;
    final artwork = image == null
        ? const  _ArtworkFallback()
        : Image.asset(
            image,
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => const _ArtworkFallback(),
          );

    return Hero(
      tag: 'app-artwork-${app.name}',
      child: Stack(
        fit: StackFit.expand,
        children: [
          artwork,
          const DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.transparent, Color(0x66030A14)],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ArtworkFallback extends StatelessWidget {
  const _ArtworkFallback();

  @override
  Widget build(BuildContext context) {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF123B63), Color(0xFF0F1629)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Icon(Icons.phone_iphone_rounded, size: 52, color: AppColors.accent),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;

  const _Badge({required this.text});

  @override
  Widget build(BuildContext context) {
    if (text.isEmpty) return const SizedBox.shrink();
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 7),
      decoration: BoxDecoration(
        color: const Color(0xCC07101F),
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.white.withValues(alpha: 0.18)),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
      ),
    );
  }
}

class _TechnologyChip extends StatelessWidget {
  final String label;

  const _TechnologyChip({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 5),
      decoration: BoxDecoration(
        color: AppColors.cardBgLight,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Text(
        label,
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.textSecondary,
              fontSize: 10,
            ),
      ),
    );
  }
}
