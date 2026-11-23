import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../models/models.dart';
import '../utils/app_theme.dart';
import '../widgets/section_widgets.dart';

class AppDetailsScreen extends StatelessWidget {
  final AppModel app;

  const AppDetailsScreen({super.key, required this.app});

  Future<void> _openStore(BuildContext context, String? url) async {
    if (url == null || url.isEmpty) return;
    final isArabic = Localizations.localeOf(context).languageCode == 'ar';
    final opened = await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    );
    if (!opened && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            isArabic ? 'تعذر فتح رابط المتجر' : 'Could not open the store link.',
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context);
    final isArabic = locale.languageCode == 'ar';
    final category = appCategoryLabel(locale, app.categoryKey);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 310,
            backgroundColor: AppColors.primary,
            foregroundColor: Colors.white,
            title: Text(app.name, maxLines: 1, overflow: TextOverflow.ellipsis),
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'app-artwork-${app.name}',
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    if (app.screenshots.isNotEmpty)
                      Image.asset(
                        app.screenshots.first,
                        fit: BoxFit.cover,
                        errorBuilder: (_, __, ___) => _headerFallback(),
                      )
                    else
                      _headerFallback(),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0x55050B16),
                            Color(0x22050B16),
                            Color(0xAA050B16),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1080),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 30, 24, 72),
                  child: LayoutBuilder(
                    builder: (context, constraints) {
                      final wide = constraints.maxWidth >= 760;
                      final introduction = _Introduction(
                        app: app,
                        category: category,
                        isArabic: isArabic,
                      );
                      final storePanel = _StorePanel(
                        app: app,
                        isArabic: isArabic,
                        onOpenStore: (url) => _openStore(context, url),
                      );

                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (wide)
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(flex: 7, child: introduction),
                                const SizedBox(width: 28),
                                Expanded(flex: 4, child: storePanel),
                              ],
                            )
                          else ...[
                            introduction,
                            const SizedBox(height: 26),
                            storePanel,
                          ],
                          const SizedBox(height: 28),
                          _TechnologySection(
                            technologies: app.technologies,
                            isArabic: isArabic,
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _headerFallback() {
    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF123B63), Color(0xFF0F1629)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Icon(Icons.phone_iphone_rounded, size: 64, color: AppColors.accent),
      ),
    );
  }
}

class _Introduction extends StatelessWidget {
  final AppModel app;
  final String category;
  final bool isArabic;

  const _Introduction({
    required this.app,
    required this.category,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: 9,
          runSpacing: 9,
          children: [
            _MetaChip(icon: Icons.grid_view_rounded, label: category),
            if (app.year != null)
              _MetaChip(icon: Icons.calendar_today_outlined, label: app.year!),
            if (app.clientName != null)
              _MetaChip(
                icon: Icons.business_outlined,
                label: app.clientName!,
              ),
          ],
        ),
        const SizedBox(height: 22),
        Text(
          isArabic ? 'عن التطبيق' : 'About the app',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
        ),
        const SizedBox(height: 12),
        Text(
          app.description.of(Localizations.localeOf(context)),
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                color: AppColors.textSecondary,
                height: 1.8,
              ),
        ),
      ],
    );
  }
}

class _StorePanel extends StatelessWidget {
  final AppModel app;
  final bool isArabic;
  final ValueChanged<String> onOpenStore;

  const _StorePanel({
    required this.app,
    required this.isArabic,
    required this.onOpenStore,
  });

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isArabic ? 'حمّل التطبيق' : 'Get the app',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
          ),
          const SizedBox(height: 8),
          Text(
            isArabic
                ? 'افتح صفحة التطبيق الرسمية في المتجر.'
                : 'Open the official app listing in your store.',
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondary,
                ),
          ),
          const SizedBox(height: 18),
          if (app.playStoreUrl != null) ...[
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () => onOpenStore(app.playStoreUrl!),
                icon: const Icon(Icons.shop_outlined),
                label: Text(isArabic ? 'Google Play' : 'Get it on Google Play'),
              ),
            ),
          ],
          if (app.appStoreUrl != null) ...[
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () => onOpenStore(app.appStoreUrl!),
                icon: const Icon(Icons.apple),
                label: Text(isArabic ? 'App Store' : 'Download on the App Store'),
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _TechnologySection extends StatelessWidget {
  final List<String> technologies;
  final bool isArabic;

  const _TechnologySection({
    required this.technologies,
    required this.isArabic,
  });

  @override
  Widget build(BuildContext context) {
    return SurfaceCard(
      padding: const EdgeInsets.all(22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.code_rounded, color: AppColors.accent),
              const SizedBox(width: 10),
              Text(
                isArabic ? 'التقنيات المستخدمة' : 'Technology stack',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: technologies
                .map((technology) => _MetaChip(
                      icon: Icons.check_circle_outline,
                      label: technology,
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class _MetaChip extends StatelessWidget {
  final IconData icon;
  final String label;

  const _MetaChip({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
      decoration: BoxDecoration(
        color: AppColors.cardBgLight,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.glassBorder),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 15, color: AppColors.accent),
          const SizedBox(width: 7),
          Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  color: AppColors.textSecondary,
                  fontWeight: FontWeight.w600,
                ),
          ),
        ],
      ),
    );
  }
}
