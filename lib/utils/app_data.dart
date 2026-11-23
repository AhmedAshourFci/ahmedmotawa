import 'package:flutter/material.dart';
import '../models/models.dart';

class AppData {
  static const LocalizedText name = LocalizedText(
    en: 'Ahmed Motawa',
    ar: 'أحمد مطوع',
  );

  static const LocalizedText title = LocalizedText(
    en: 'Flutter & Mobile App Developer',
    ar: 'مطور Flutter وتطبيقات الجوال',
  );

  static const LocalizedText subtitle = LocalizedText(
    en: 'Building Cross-Platform Experiences',
    ar: 'بناء تجارب متعددة المنصات',
  );

  static const LocalizedText bio = LocalizedText(
    en:
        'Experienced Flutter Developer with 5+ years crafting high-performance mobile applications for Android and iOS. Specialized in building scalable apps with clean architecture, state management, and stunning UI/UX. Passionate about turning ideas into polished digital products.',
    ar:
        'مطور Flutter بخبرة تزيد عن 5 سنوات في بناء تطبيقات عالية الأداء لأندرويد وiOS. متخصص في التطبيقات القابلة للتوسع، البنية النظيفة، إدارة الحالة، وواجهات استخدام مميزة. شغوف بتحويل الأفكار إلى منتجات رقمية متقنة.',
  );

  static const LocalizedText location = LocalizedText(
    en: 'New Valley, Egypt',
    ar: 'الوادي الجديد، مصر',
  );

  static const String email = 'Ahmedflutter5590@gmail.com';
  static const String phone = '0201012766569';
  static const String whatsappPhone = '201285895547';
  static const String linkedin = '';
  static const String github = '';

  static List<ContactModel> get contacts => [
        const ContactModel(
          typeKey: 'phone',
          value: phone,
          url: 'tel:$phone',
          icon: Icons.phone,
        ),
        const ContactModel(
          typeKey: 'email',
          value: email,
          url: 'mailto:$email',
          icon: Icons.email,
        ),
        const ContactModel(
          typeKey: 'location',
          value: 'location',
          url: '',
          icon: Icons.location_on,
        ),
      ];

  static List<ExperienceModel> get experiences => [
        const ExperienceModel(
          title: LocalizedText(
            en: 'Freelance Flutter Developer',
            ar: 'مطور Flutter مستقل',
          ),
          company: LocalizedText(
            en: 'Self-Employed',
            ar: 'عمل حر',
          ),
          duration: LocalizedText(
            en: '2019 - Present',
            ar: '2019 - حتى الآن',
          ),
          description: LocalizedText(
            en:
                'Developed and published multiple cross-platform mobile applications for clients across various industries.',
            ar:
                'طوّرت ونشرت تطبيقات جوال متعددة المنصات لعملاء في مجالات مختلفة.',
          ),
          achievements: [
            LocalizedText(
              en: 'Published 10+ apps on Google Play Store and Apple App Store',
              ar: 'نشرت أكثر من 10 تطبيقات على Google Play وApp Store',
            ),
            LocalizedText(
              en: 'Built apps for e-commerce, POS, delivery, and social networking',
              ar: 'بنيت تطبيقات للتجارة الإلكترونية ونقاط البيع والتوصيل والشبكات الاجتماعية',
            ),
            LocalizedText(
              en: 'Implemented Firebase backend, real-time databases, and cloud functions',
              ar: 'نفّذت خلفية Firebase وقواعد بيانات لحظية ودوال سحابية',
            ),
            LocalizedText(
              en: 'Integrated Google Maps, payment gateways, and QR code systems',
              ar: 'دمجت خرائط جوجل وبوابات الدفع وأنظمة QR',
            ),
          ],
        ),
      ];

  static List<EducationModel> get education => [
        const EducationModel(
          degree: LocalizedText(
            en: 'B.Sc. Computer Science',
            ar: 'بكالوريوس علوم الحاسب',
          ),
          institution: LocalizedText(
            en: 'Faculty of Computers & Information, Minya University',
            ar: 'كلية الحاسبات والمعلومات، جامعة المنيا',
          ),
          year: '2011',
          gpa: '3.0',
          project: LocalizedText(
            en: 'Control PC Via Mobile - Remote desktop control application',
            ar: 'التحكم في الكمبيوتر عبر الموبايل — تطبيق للتحكم عن بُعد',
          ),
        ),
      ];

  static List<SkillModel> get skills => [
        const SkillModel(
          name: 'Flutter',
          proficiency: 0.95,
          icon: Icons.flutter_dash,
          categoryKey: 'framework',
        ),
        const SkillModel(
          name: 'Dart',
          proficiency: 0.92,
          icon: Icons.code,
          categoryKey: 'language',
        ),
        const SkillModel(
          name: 'State Management',
          proficiency: 0.88,
          icon: Icons.account_tree,
          categoryKey: 'framework',
        ),
        const SkillModel(
          name: 'Android (Java)',
          proficiency: 0.85,
          icon: Icons.android,
          categoryKey: 'mobile',
        ),
        const SkillModel(
          name: 'iOS Development',
          proficiency: 0.80,
          icon: Icons.apple,
          categoryKey: 'mobile',
        ),
        const SkillModel(
          name: 'Firebase',
          proficiency: 0.90,
          icon: Icons.local_fire_department,
          categoryKey: 'backend',
        ),
        const SkillModel(
          name: 'Firestore',
          proficiency: 0.88,
          icon: Icons.storage,
          categoryKey: 'backend',
        ),
        const SkillModel(
          name: 'SQLite',
          proficiency: 0.85,
          icon: Icons.table_chart,
          categoryKey: 'database',
        ),
        const SkillModel(
          name: 'REST API / JSON',
          proficiency: 0.90,
          icon: Icons.api,
          categoryKey: 'backend',
        ),
        const SkillModel(
          name: 'Git & GitHub',
          proficiency: 0.85,
          icon: Icons.source,
          categoryKey: 'tools',
        ),
        const SkillModel(
          name: 'Google Maps API',
          proficiency: 0.88,
          icon: Icons.map,
          categoryKey: 'tools',
        ),
        const SkillModel(
          name: 'Localization',
          proficiency: 0.82,
          icon: Icons.language,
          categoryKey: 'tools',
        ),
        const SkillModel(
          name: 'Clean Code',
          proficiency: 0.87,
          icon: Icons.cleaning_services,
          categoryKey: 'tools',
        ),
        const SkillModel(
          name: 'OOP',
          proficiency: 0.90,
          icon: Icons.data_object,
          categoryKey: 'concepts',
        ),
        const SkillModel(
          name: 'Problem Solving',
          proficiency: 0.88,
          icon: Icons.psychology,
          categoryKey: 'concepts',
        ),
        const SkillModel(
          name: 'Project Management',
          proficiency: 0.80,
          icon: Icons.manage_accounts,
          categoryKey: 'concepts',
        ),
      ];

  static List<AppModel> get apps => [
    const AppModel(
      name: 'Dupla: For Shared Wins',
      description: LocalizedText(
        en: 'The complete platform for organizing and participating in padel tournaments. Provides organizers with tools to manage competitions, generate draws, and track matches, while allowing players to join events, view schedules, and follow live results.',
        ar: 'المنصة المتكاملة لتنظيم والمشاركة في بطولات البادل. توفر للمنظمين أدوات إدارة البطولات والقرعة ومتابعة المباريات، وتتيح للاعبين الانضمام للبطولات ومتابعة الجداول والنتائج المباشرة.',
      ),
      categoryKey: 'sports',
      screenshots: ['assets/apps/dupla_1.jpg'],
      technologies: [
        'Flutter',
        'Dart',
        'Firebase',
        'Push Notifications',
        'Live Brackets',
      ],
      clientName: 'Mohamed Hassan',
      year: '2026',
      appStoreUrl: "https://apps.apple.com/eg/app/dupla-for-shared-wins/id6738024618",
      playStoreUrl: "https://play.google.com/store/apps/details?id=com.padelx.padeleg"

    ),
    const AppModel(
      name: 'Alysur POS - اليسر POS',
      description: LocalizedText(
        en: 'A comprehensive Point of Sale (POS) and inventory management application for retail and restaurants. Supports sales, purchases, stock tracking, customer and supplier accounts, payments, and detailed accounting and tax reports.',
        ar: 'برنامج متكامل لإدارة نقاط البيع (POS) والمطاعم، متخصص في إدارة المبيعات والمشتريات ومخزون المواد، بالإضافة إلى إدارة حسابات العملاء والموردين والمدفوعات والمقبوضات مع تقارير داعمة لكافة الحركات المخزنية والحسابية والضريبية.',
      ),
      categoryKey: 'business',
      screenshots: ['assets/apps/alyusr_1.jpg'],
      technologies: [
        'Flutter',
        'Dart',
        'SQLite',
        'REST API',
        'POS & Inventory',
        'Thermal Printing',
      ],
      clientName: 'Alysur Software',
      year: '2026',
      playStoreUrl: "https://play.google.com/store/apps/details?id=pos.alyusr.com.pos"
    ),
    const AppModel(
      name: 'Mareez - ماريز',
      description: LocalizedText(
        en: 'Mareez is an e-commerce platform specializing in children’s wear and school uniforms since 2015. The app offers a seamless shopping experience for browsing categories, selecting sizes, and secure online purchasing.',
        ar: 'ماريز .. أناقتك تبدأ من هنا. منصة تسوق إلكتروني متكاملة متخصصة في مجال مستلزمات الأطفال والزي المدرسي منذ عام 2015، يتيح التطبيق تصفح المنتجات واختيار المقاسات المتنوعة وإتمام الشراء بسهولة وأمان.',
      ),
      categoryKey: 'shopping', // أو 'business' بناءً على المتجر
      screenshots: ['assets/apps/marez_1.jpg'],
      technologies: [
        'Flutter',
        'Dart',
        'Firebase',
        'REST API',
        'Payment Gateway',
        'Shopping Cart',
      ],
      clientName: 'Yahya Alluhabi', // اسم المطور الظاهر في المتجر
      year: '2023', // أو العام الفعلي لتطويره
      appStoreUrl: "https://apps.apple.com/eg/app/%D9%85%D8%A7%D8%B1%D9%8A%D8%B2/id6756973675"
    ),

    const AppModel(
      name: 'Tajweedly: Learn Quran Online',
      description: LocalizedText(
        en: 'A specialized online platform for Quran memorization and Tajweed for adults and children worldwide through 1-on-1 sessions. Students can experience a free trial session, compare teachers by academic qualifications, certificates, reviews, and comfort, view available hours and session pricing, and book flexible lessons.',
        ar: 'منصة متخصصة لحفظ القرآن الكريم وتعلم التجويد أونلاين للكبار والصغار من مختلف أنحاء العالم عبر جلسات فردية مباشرة. تتيح للطلاب تجربة جلسة مجانية، والمقارنة بين المعلمين حسب المؤهلات العلمية والشهادات والتقييمات والارتياح النفسي، مع عرض المواعيد المتاحة وأسعار الجلسات وحجز الدروس بمرونة.',
      ),
      categoryKey: 'education',
      screenshots: ['assets/apps/tajweedly_1.jpg'],
      technologies: [
        'Flutter',
        'Dart',
        '1-on-1 Sessions',
        'Booking Calendar',
        'In-App Chat',
      ],
      clientName: 'Ziad Amer',
      year: '2025',
      appStoreUrl: 'https://apps.apple.com/eg/app/tajweedly-learn-quran-online/id6472712507',
      playStoreUrl: 'https://play.google.com/store/apps/details?id=com.learnquranonline.tajweedly',
    ),
    const AppModel(
      name: 'بيت يهمنا',
      description: LocalizedText(
        en: 'A Saudi recruitment and staffing platform providing qualified human resources across domestic work, professional staffing, healthcare caregivers, private drivers, technical workers, and business workforce solutions, with hourly, live-in, and recruitment options plus order tracking and promotional offers.',
        ar: 'منصة سعودية متخصصة في تقديم خدمات استقدام الكوادر البشرية المؤهلة في مختلف التخصصات، وتشمل العمالة المنزلية، واستقدام الكوادر المهنية، والممرضين ومقدمي الرعاية، والسائقين الخاصين، والعمالة المهنية والفنية، وحلول القوى العاملة لقطاع الأعمال، مع خيارات حجز بالساعة ومقيمة واستقدام ومتابعة الطلبات والعروض.',
      ),
      categoryKey: 'business',
      screenshots: ['assets/apps/baytak_yuhimna_1.jpg'],
      technologies: [
        'Flutter',
        'Dart',
        'Order Tracking',
        'Service Booking',
        'Promotions & Offers',
      ],
      clientName: 'ALGHANAMI ABDULAZIZ MOHAMMED',
      year: '2026',
      appStoreUrl: 'https://apps.apple.com/eg/app/%D8%A8%D9%8A%D8%AA%D9%83-%D9%8A%D9%87%D9%85%D9%86%D8%A7/id6764091077',
      playStoreUrl: '',
    ),
        // const AppModel(
        //   name: 'Theqah',
        //   description: LocalizedText(
        //     en: 'Social networking and communication platform',
        //     ar: 'منصة تواصل اجتماعي ومراسلة',
        //   ),
        //   categoryKey: 'social',
        //   screenshots: ['assets/apps/theqah/1.png'],
        //   technologies: ['Flutter', 'Firebase', 'Real-time Chat'],
        //   clientName: 'Client Project',
        //   year: '2023',
        // ),
        // const AppModel(
        //   name: 'Al Qannas',
        //   description: LocalizedText(
        //     en: 'Hunting and outdoor activities app',
        //     ar: 'تطبيق للصيد والأنشطة الخارجية',
        //   ),
        //   categoryKey: 'lifestyle',
        //   screenshots: ['assets/apps/alqannas/1.png'],
        //   technologies: ['Flutter', 'Maps', 'GPS Tracking'],
        //   clientName: 'Client Project',
        //   year: '2022',
        // ),
        // const AppModel(
        //   name: 'Check Point',
        //   description: LocalizedText(
        //     en: 'Employee attendance tracking with QR code scanning and location verification',
        //     ar: 'تتبع حضور الموظفين بمسح QR والتحقق من الموقع',
        //   ),
        //   categoryKey: 'business',
        //   screenshots: ['assets/apps/checkpoint/1.png'],
        //   technologies: ['Flutter', 'QR Code', 'Location Services', 'Firebase'],
        //   clientName: 'Client Project',
        //   year: '2023',
        // ),
        // const AppModel(
        //   name: 'Alyusr Dashboard',
        //   description: LocalizedText(
        //     en: 'Business management dashboard with analytics and reporting',
        //     ar: 'لوحة إدارة أعمال مع تحليلات وتقارير',
        //   ),
        //   categoryKey: 'business',
        //   screenshots: ['assets/apps/alyusr_dashboard/1.png'],
        //   technologies: ['Flutter', 'Charts', 'Firebase'],
        //   clientName: 'Alyusr',
        //   year: '2022',
        // ),
        // const AppModel(
        //   name: 'Alyusr POS',
        //   description: LocalizedText(
        //     en: 'Point of Sale system with inventory management and offline support',
        //     ar: 'نظام نقاط بيع مع إدارة مخزون ودعم العمل بدون إنترنت',
        //   ),
        //   categoryKey: 'business',
        //   screenshots: ['assets/apps/alyusr_pos/1.png'],
        //   technologies: ['Flutter', 'SQLite', 'Offline Sync', 'Printing'],
        //   clientName: 'Alyusr',
        //   year: '2022',
        // ),
        // const AppModel(
        //   name: 'Eayni',
        //   description: LocalizedText(
        //     en: 'Service marketplace platform',
        //     ar: 'منصة سوق للخدمات',
        //   ),
        //   categoryKey: 'marketplace',
        //   screenshots: ['assets/apps/eayni/1.png'],
        //   technologies: ['Flutter', 'REST API', 'Payments'],
        //   clientName: 'Client Project',
        //   year: '2023',
        // ),
        // const AppModel(
        //   name: 'Eayni Driver',
        //   description: LocalizedText(
        //     en: 'Driver companion app for delivery and logistics',
        //     ar: 'تطبيق للسائقين في التوصيل واللوجستيات',
        //   ),
        //   categoryKey: 'logistics',
        //   screenshots: ['assets/apps/eayni_driver/1.png'],
        //   technologies: ['Flutter', 'Maps', 'Real-time Tracking'],
        //   clientName: 'Client Project',
        //   year: '2023',
        // ),
        // const AppModel(
        //   name: 'Auction Of Cars',
        //   description: LocalizedText(
        //     en: 'Live car auction platform with real-time bidding',
        //     ar: 'منصة مزاد سيارات مباشر مع مزايدة لحظية',
        //   ),
        //   categoryKey: 'automotive',
        //   screenshots: ['assets/apps/auction_cars/1.png'],
        //   technologies: ['Flutter', 'WebSocket', 'Real-time', 'Payment'],
        //   clientName: 'Client Project',
        //   year: '2023',
        // ),
        // const AppModel(
        //   name: 'Etgahat Aman',
        //   description: LocalizedText(
        //     en: 'Safety and security company management app',
        //     ar: 'تطبيق إدارة لشركة أمن وسلامة',
        //   ),
        //   categoryKey: 'business',
        //   screenshots: ['assets/apps/etgahat/1.png'],
        //   technologies: ['Flutter', 'Firebase', 'Notifications'],
        //   clientName: 'Etgahat Aman Company',
        //   year: '2022',
        // ),
        // const AppModel(
        //   name: 'Attendance',
        //   description: LocalizedText(
        //     en: 'Smart attendance management system',
        //     ar: 'نظام ذكي لإدارة الحضور',
        //   ),
        //   categoryKey: 'business',
        //   screenshots: ['assets/apps/attendance/1.png'],
        //   technologies: ['Flutter', 'QR Code', 'Firebase'],
        //   clientName: 'Client Project',
        //   year: '2023',
        // ),
      ];

  static const LocalizedText degreeShort = LocalizedText(
    en: 'B.Sc. Computer Science',
    ar: 'بكالوريوس علوم الحاسب',
  );

  static const LocalizedText universityShort = LocalizedText(
    en: 'Minya University',
    ar: 'جامعة المنيا',
  );
}
