import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_ar.dart';
import 'app_localizations_en.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
    : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
        delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('ar'),
    Locale('en'),
  ];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Ahmed Motawa | Flutter Developer'**
  String get appTitle;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navAbout.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get navAbout;

  /// No description provided for @navSkills.
  ///
  /// In en, this message translates to:
  /// **'Skills'**
  String get navSkills;

  /// No description provided for @navExperience.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get navExperience;

  /// No description provided for @navApps.
  ///
  /// In en, this message translates to:
  /// **'Apps'**
  String get navApps;

  /// No description provided for @navContact.
  ///
  /// In en, this message translates to:
  /// **'Contact'**
  String get navContact;

  /// No description provided for @languageToggle.
  ///
  /// In en, this message translates to:
  /// **'عربي'**
  String get languageToggle;

  /// No description provided for @heroBadge.
  ///
  /// In en, this message translates to:
  /// **'Flutter Developer'**
  String get heroBadge;

  /// No description provided for @heroHighlight.
  ///
  /// In en, this message translates to:
  /// **'Cross-Platform'**
  String get heroHighlight;

  /// No description provided for @heroBeforeHighlight.
  ///
  /// In en, this message translates to:
  /// **'Building '**
  String get heroBeforeHighlight;

  /// No description provided for @heroAfterHighlight.
  ///
  /// In en, this message translates to:
  /// **' Experiences'**
  String get heroAfterHighlight;

  /// No description provided for @hireMe.
  ///
  /// In en, this message translates to:
  /// **'Hire Me'**
  String get hireMe;

  /// No description provided for @callMe.
  ///
  /// In en, this message translates to:
  /// **'Call Me'**
  String get callMe;

  /// No description provided for @downloadCv.
  ///
  /// In en, this message translates to:
  /// **'Download CV'**
  String get downloadCv;

  /// No description provided for @aboutTitle.
  ///
  /// In en, this message translates to:
  /// **'About Me'**
  String get aboutTitle;

  /// No description provided for @aboutWho.
  ///
  /// In en, this message translates to:
  /// **'Who Am I?'**
  String get aboutWho;

  /// No description provided for @aboutBody1.
  ///
  /// In en, this message translates to:
  /// **'I am a passionate Flutter Developer with over 5 years of experience in mobile application development. I specialize in building cross-platform applications that deliver native performance and stunning user experiences.'**
  String get aboutBody1;

  /// No description provided for @aboutBody2.
  ///
  /// In en, this message translates to:
  /// **'My journey started with Android development using Java, and I evolved into Flutter to create beautiful, efficient apps for both Android and iOS. I have successfully delivered 10+ applications across e-commerce, POS, delivery, and social networking.'**
  String get aboutBody2;

  /// No description provided for @personalInfo.
  ///
  /// In en, this message translates to:
  /// **'Personal Info'**
  String get personalInfo;

  /// No description provided for @labelName.
  ///
  /// In en, this message translates to:
  /// **'Name'**
  String get labelName;

  /// No description provided for @labelDegree.
  ///
  /// In en, this message translates to:
  /// **'Degree'**
  String get labelDegree;

  /// No description provided for @labelUniversity.
  ///
  /// In en, this message translates to:
  /// **'University'**
  String get labelUniversity;

  /// No description provided for @labelLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get labelLocation;

  /// No description provided for @labelEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get labelEmail;

  /// No description provided for @labelPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get labelPhone;

  /// No description provided for @languages.
  ///
  /// In en, this message translates to:
  /// **'Languages'**
  String get languages;

  /// No description provided for @langArabic.
  ///
  /// In en, this message translates to:
  /// **'Arabic (Native)'**
  String get langArabic;

  /// No description provided for @langEnglish.
  ///
  /// In en, this message translates to:
  /// **'English (Intermediate)'**
  String get langEnglish;

  /// No description provided for @skillsTitle.
  ///
  /// In en, this message translates to:
  /// **'Skills & Expertise'**
  String get skillsTitle;

  /// No description provided for @skillsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Technologies and tools I work with daily'**
  String get skillsSubtitle;

  /// No description provided for @catFramework.
  ///
  /// In en, this message translates to:
  /// **'Framework'**
  String get catFramework;

  /// No description provided for @catLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get catLanguage;

  /// No description provided for @catMobile.
  ///
  /// In en, this message translates to:
  /// **'Mobile'**
  String get catMobile;

  /// No description provided for @catBackend.
  ///
  /// In en, this message translates to:
  /// **'Backend'**
  String get catBackend;

  /// No description provided for @catDatabase.
  ///
  /// In en, this message translates to:
  /// **'Database'**
  String get catDatabase;

  /// No description provided for @catTools.
  ///
  /// In en, this message translates to:
  /// **'Tools'**
  String get catTools;

  /// No description provided for @catConcepts.
  ///
  /// In en, this message translates to:
  /// **'Concepts'**
  String get catConcepts;

  /// No description provided for @experienceTitle.
  ///
  /// In en, this message translates to:
  /// **'Experience'**
  String get experienceTitle;

  /// No description provided for @experienceSubtitle.
  ///
  /// In en, this message translates to:
  /// **'My professional journey and achievements'**
  String get experienceSubtitle;

  /// No description provided for @educationTitle.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get educationTitle;

  /// No description provided for @appsTitle.
  ///
  /// In en, this message translates to:
  /// **'My Apps'**
  String get appsTitle;

  /// No description provided for @appsSubtitle.
  ///
  /// In en, this message translates to:
  /// **'A selection of applications I have built and published'**
  String get appsSubtitle;

  /// No description provided for @clientLabel.
  ///
  /// In en, this message translates to:
  /// **'Client'**
  String get clientLabel;

  /// No description provided for @statYears.
  ///
  /// In en, this message translates to:
  /// **'Years Experience'**
  String get statYears;

  /// No description provided for @statApps.
  ///
  /// In en, this message translates to:
  /// **'Apps Published'**
  String get statApps;

  /// No description provided for @statClients.
  ///
  /// In en, this message translates to:
  /// **'Happy Clients'**
  String get statClients;

  /// No description provided for @statTech.
  ///
  /// In en, this message translates to:
  /// **'Technologies'**
  String get statTech;

  /// No description provided for @contactTitle.
  ///
  /// In en, this message translates to:
  /// **'Get In Touch'**
  String get contactTitle;

  /// No description provided for @contactSubtitle.
  ///
  /// In en, this message translates to:
  /// **'Have a project in mind? Let\'s work together!'**
  String get contactSubtitle;

  /// No description provided for @contactInfo.
  ///
  /// In en, this message translates to:
  /// **'Contact Information'**
  String get contactInfo;

  /// No description provided for @followMe.
  ///
  /// In en, this message translates to:
  /// **'Follow Me'**
  String get followMe;

  /// No description provided for @sendMessage.
  ///
  /// In en, this message translates to:
  /// **'Send Message'**
  String get sendMessage;

  /// No description provided for @fieldName.
  ///
  /// In en, this message translates to:
  /// **'Your Name'**
  String get fieldName;

  /// No description provided for @fieldEmail.
  ///
  /// In en, this message translates to:
  /// **'Your Email'**
  String get fieldEmail;

  /// No description provided for @fieldSubject.
  ///
  /// In en, this message translates to:
  /// **'Subject'**
  String get fieldSubject;

  /// No description provided for @fieldMessage.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get fieldMessage;

  /// No description provided for @contactPhone.
  ///
  /// In en, this message translates to:
  /// **'Phone'**
  String get contactPhone;

  /// No description provided for @contactEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get contactEmail;

  /// No description provided for @contactLocation.
  ///
  /// In en, this message translates to:
  /// **'Location'**
  String get contactLocation;

  /// No description provided for @footerRights.
  ///
  /// In en, this message translates to:
  /// **'© 2026 Ahmed Motawa. All rights reserved.'**
  String get footerRights;

  /// No description provided for @footerBuilt.
  ///
  /// In en, this message translates to:
  /// **'Built with Flutter'**
  String get footerBuilt;

  /// No description provided for @formIncomplete.
  ///
  /// In en, this message translates to:
  /// **'Please fill in all fields'**
  String get formIncomplete;

  /// No description provided for @formInvalidEmail.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid email'**
  String get formInvalidEmail;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['ar', 'en'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'en':
      return AppLocalizationsEn();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
