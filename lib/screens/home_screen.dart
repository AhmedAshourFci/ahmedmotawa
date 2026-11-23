import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';

import '../l10n/app_localizations.dart';
import '../utils/app_data.dart';
import '../utils/app_theme.dart';
import '../widgets/language_toggle.dart';
import 'sections/about_section.dart';
import 'sections/apps_section.dart';
import 'sections/contact_section.dart';
import 'sections/experience_section.dart';
import 'sections/hero_section.dart';
import 'sections/skills_section.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();
  final List<GlobalKey> _sectionKeys = List.generate(6, (_) => GlobalKey());
  int _currentSection = 0;
  bool _showScrollTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<String> _navItems(AppLocalizations l10n) => [
        l10n.navHome,
        l10n.navAbout,
        l10n.navSkills,
        l10n.navExperience,
        l10n.navApps,
        l10n.navContact,
      ];

  void _onScroll() {
    final offset = _scrollController.offset;
    final show = offset > 500;
    var current = _currentSection;

    for (int i = 0; i < _sectionKeys.length; i++) {
      final ctx = _sectionKeys[i].currentContext;
      if (ctx != null) {
        final box = ctx.findRenderObject() as RenderBox?;
        if (box != null) {
          final position = box.localToGlobal(Offset.zero);
          if (position.dy <= 150) current = i;
        }
      }
    }

    if (show != _showScrollTop || current != _currentSection) {
      setState(() {
        _showScrollTop = show;
        _currentSection = current;
      });
    }
  }

  void _scrollToSection(int index) {
    final ctx = _sectionKeys[index].currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 800),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isDesktop = ResponsiveBreakpoints.of(context).isDesktop;
    final isRtl = Directionality.of(context) == TextDirection.rtl;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(isDesktop, l10n),
      drawer: !isDesktop ? _buildDrawer(l10n) : null,
      body: Container(
        decoration: const BoxDecoration(gradient: AppGradients.primary),
        child: Stack(
          children: [
            SingleChildScrollView(
              controller: _scrollController,
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  HeroSection(key: _sectionKeys[0]),
                  AboutSection(key: _sectionKeys[1]),
                  SkillsSection(key: _sectionKeys[2]),
                  ExperienceSection(key: _sectionKeys[3]),
                  AppsSection(key: _sectionKeys[4]),
                  ContactSection(key: _sectionKeys[5]),
                  _buildFooter(l10n),
                ],
              ),
            ),
            if (_showScrollTop) _buildScrollToTop(isRtl),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(bool isDesktop, AppLocalizations l10n) {
    return AppBar(
      backgroundColor: AppColors.primary.withValues(alpha: 0.94),
      elevation: 0,
      toolbarHeight: 72,
      titleSpacing: 16,
      title: Row(
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              gradient: AppGradients.accent,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [AppShadows.buttonGlow],
            ),
            child: const Center(
              child: Text(
                'AM',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
          ),
          if (isDesktop) ...[
            const SizedBox(width: 12),
            Flexible(
              child: Text(
                AppData.name.of(Localizations.localeOf(context)),
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
            ),
          ],
        ],
      ),
      actions: [
        if (isDesktop)
          ...List.generate(
            _navItems(l10n).length,
            (i) => _buildNavItem(_navItems(l10n)[i], i),
          ),
        const Padding(
          padding: EdgeInsetsDirectional.only(end: 16, start: 8),
          child: Center(child: LanguageToggle()),
        ),
      ],
    );
  }

  Widget _buildNavItem(String label, int index) {
    final isActive = _currentSection == index;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2),
      child: TextButton(
        onPressed: () => _scrollToSection(index),
        style: TextButton.styleFrom(
          foregroundColor: isActive ? AppColors.accent : AppColors.textMuted,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontWeight: isActive ? FontWeight.bold : FontWeight.w500,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedContainer(
              duration: const Duration(milliseconds: 250),
              width: isActive ? 18 : 0,
              height: 2,
              decoration: BoxDecoration(
                color: AppColors.accent,
                borderRadius: BorderRadius.circular(1),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer(AppLocalizations l10n) {
    final locale = Localizations.localeOf(context);
    return Drawer(
      backgroundColor: AppColors.primary,
      child: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
              child: Column(
                children: [
                  Container(
                    width: 72,
                    height: 72,
                    decoration: const BoxDecoration(
                      gradient: AppGradients.accent,
                      shape: BoxShape.circle,
                    ),
                    child: const Center(
                      child: Text(
                        'AM',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    AppData.name.of(locale),
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    AppData.title.of(locale),
                    style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const Divider(),
            ...List.generate(_navItems(l10n).length, (index) {
              return ListTile(
                leading: Icon(
                  _getNavIcon(index),
                  color: _currentSection == index
                      ? AppColors.accent
                      : AppColors.textMuted,
                ),
                title: Text(
                  _navItems(l10n)[index],
                  style: TextStyle(
                    color: _currentSection == index
                        ? AppColors.accent
                        : Colors.white,
                    fontWeight: _currentSection == index
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _scrollToSection(index);
                },
              );
            }),
          ],
        ),
      ),
    );
  }

  IconData _getNavIcon(int index) {
    const icons = [
      Icons.home_outlined,
      Icons.person_outline,
      Icons.code,
      Icons.work_outline,
      Icons.apps_outlined,
      Icons.mail_outline,
    ];
    return icons[index];
  }

  Widget _buildScrollToTop(bool isRtl) {
    return Positioned.directional(
      textDirection: isRtl ? TextDirection.rtl : TextDirection.ltr,
      end: 24,
      bottom: 24,
      child: FloatingActionButton(
        onPressed: () {
          _scrollController.animateTo(
            0,
            duration: const Duration(milliseconds: 900),
            curve: Curves.easeInOutCubic,
          );
        },
        backgroundColor: AppColors.accent,
        child: const Icon(Icons.arrow_upward, color: Colors.white),
      ),
    );
  }

  Widget _buildFooter(AppLocalizations l10n) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 8, 24, 40),
      child: Column(
        children: [
          const Divider(),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildSocialButton(
                FontAwesomeIcons.whatsapp,
                'https://wa.me/${AppData.whatsappPhone}',
              ),
              _buildSocialButton(
                FontAwesomeIcons.envelope,
                'mailto:${AppData.email}',
              ),
              _buildSocialButton(
                FontAwesomeIcons.phone,
                'tel:${AppData.phone}',
              ),
            ],
          ),
          const SizedBox(height: 20),
          Text(
            l10n.footerRights,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 6),
          Text(
            l10n.footerBuilt,
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: AppColors.accent,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialButton(IconData icon, String url) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: InkWell(
        onTap: () => launchUrl(Uri.parse(url)),
        borderRadius: BorderRadius.circular(25),
        child: Container(
          width: 48,
          height: 48,
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
