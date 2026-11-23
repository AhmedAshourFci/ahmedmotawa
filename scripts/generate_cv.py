"""Generate ATS-friendly, text-based PDF resumes for the portfolio website."""

from html import escape
from pathlib import Path
import subprocess
import tempfile


ROOT = Path(__file__).resolve().parents[1]
OUTPUT = ROOT / "assets" / "cv"
EDGE = Path(r"C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe")
CHROME = Path(r"C:\Program Files\Google\Chrome\Application\chrome.exe")
BROWSER = EDGE if EDGE.exists() else CHROME


def html_document(title, sections, *, rtl=False):
    lang = "ar" if rtl else "en"
    direction = "rtl" if rtl else "ltr"
    content = []
    for style, text in sections:
        value = escape(text)
        if style == "Title":
            content.append(f"<h1>{value}</h1>")
        elif style == "Heading1":
            content.append(f"<h2>{value}</h2>")
        elif style == "Heading2":
            content.append(f"<h3>{value}</h3>")
        elif text.startswith("• "):
            content.append(f'<p class="bullet">{value}</p>')
        elif "@" in text or text.startswith("New Valley") or text.startswith("الوادي"):
            content.append(f'<p class="contact" dir="auto">{value}</p>')
        else:
            content.append(f"<p>{value}</p>")

    return f'''<!doctype html>
<html lang="{lang}" dir="{direction}">
<head>
<meta charset="utf-8">
<title>{escape(title)}</title>
<style>
@page {{ size: Letter; margin: 0.58in 0.68in; }}
* {{ box-sizing: border-box; }}
body {{ font-family: Arial, "Arial Unicode MS", sans-serif; font-size: 10pt; line-height: 1.34; color: #111; direction: {direction}; }}
h1 {{ font-size: 21pt; margin: 0 0 3pt; line-height: 1.2; }}
h2 {{ font-size: 12pt; margin: 14pt 0 4pt; padding-bottom: 2pt; border-bottom: 1px solid #777; break-after: avoid; }}
h3 {{ font-size: 10.5pt; margin: 7pt 0 2pt; break-after: avoid; }}
p {{ margin: 0 0 4pt; orphans: 2; widows: 2; }}
.contact {{ direction: ltr; text-align: {"left" if not rtl else "right"}; unicode-bidi: plaintext; margin-bottom: 10pt; }}
.bullet {{ padding-inline-start: 14pt; text-indent: -10pt; }}
</style>
</head>
<body>{''.join(content)}</body>
</html>'''


def build_pdf(filename, title, sections, *, rtl=False):
    if not BROWSER.exists():
        raise FileNotFoundError("Microsoft Edge or Google Chrome is required to generate the PDFs.")
    OUTPUT.mkdir(parents=True, exist_ok=True)
    pdf_path = OUTPUT / filename
    with tempfile.TemporaryDirectory(prefix="motawa_cv_") as temp_dir:
        temp = Path(temp_dir)
        html_path = temp / "resume.html"
        profile_path = temp / "browser-profile"
        html_path.write_text(html_document(title, sections, rtl=rtl), encoding="utf-8")
        subprocess.run(
            [
                str(BROWSER),
                "--headless=new",
                "--disable-gpu",
                "--no-first-run",
                f"--user-data-dir={profile_path}",
                "--no-pdf-header-footer",
                f"--print-to-pdf={pdf_path}",
                html_path.as_uri(),
            ],
            check=True,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            timeout=60,
        )
        if not pdf_path.exists() or pdf_path.stat().st_size < 1000:
            raise RuntimeError(f"PDF generation failed for {filename}")


skills_en = [
    "Flutter, Dart, Android (Java), iOS Development",
    "State Management, Clean Architecture, OOP, Clean Code",
    "Firebase, Firestore, SQLite, REST APIs, JSON",
    "Google Maps API, GPS, QR Code, Localization",
    "Git, GitHub, Problem Solving, Project Management",
]
skills_ar = [
    "Flutter، Dart، Android (Java)، تطوير iOS",
    "إدارة الحالة، البنية النظيفة، OOP، Clean Code",
    "Firebase، Firestore، SQLite، REST APIs، JSON",
    "Google Maps API، GPS، QR Code، التدويل",
    "Git، GitHub، حل المشكلات، إدارة المشاريع",
]
achievements_en = [
    "Published 10+ apps on Google Play Store and Apple App Store",
    "Built applications for e-commerce, POS, delivery, and social networking",
    "Implemented Firebase backend, real-time databases, and cloud functions",
    "Integrated Google Maps, payment gateways, and QR code systems",
]
achievements_ar = [
    "نشرت أكثر من 10 تطبيقات على Google Play وApple App Store",
    "طورت تطبيقات للتجارة الإلكترونية ونقاط البيع والتوصيل والشبكات الاجتماعية",
    "نفذت خدمات Firebase وقواعد بيانات لحظية ودوال سحابية",
    "دمجت خرائط Google وبوابات الدفع وأنظمة QR Code",
]
apps = [
    ("Theqah", "Social networking and communication platform", "Flutter, Firebase, Real-time Chat", "منصة تواصل اجتماعي ومراسلة", "Flutter، Firebase، محادثة فورية"),
    ("Al Qannas", "Hunting and outdoor activities app", "Flutter, Maps, GPS Tracking", "تطبيق للصيد والأنشطة الخارجية", "Flutter، الخرائط، تتبع GPS"),
    ("Check Point", "Employee attendance tracking with QR scanning and location verification", "Flutter, QR Code, Location Services, Firebase", "تتبع حضور الموظفين عبر QR والتحقق من الموقع", "Flutter، QR Code، خدمات الموقع، Firebase"),
    ("Alyusr Dashboard", "Business management dashboard with analytics and reporting", "Flutter, Charts, Firebase", "لوحة إدارة أعمال مع تحليلات وتقارير", "Flutter، مخططات، Firebase"),
    ("Alyusr POS", "Point of Sale with inventory management and offline support", "Flutter, SQLite, Offline Sync, Printing", "نظام نقاط بيع مع إدارة مخزون ودعم العمل دون إنترنت", "Flutter، SQLite، مزامنة دون اتصال، طباعة"),
    ("Eayni", "Service marketplace platform", "Flutter, REST API, Payments", "منصة سوق للخدمات", "Flutter، REST API، المدفوعات"),
    ("Eayni Driver", "Driver app for delivery and logistics", "Flutter, Maps, Real-time Tracking", "تطبيق للسائقين في التوصيل واللوجستيات", "Flutter، الخرائط، التتبع اللحظي"),
    ("Auction Of Cars", "Live car auction with real-time bidding", "Flutter, WebSocket, Payments", "منصة مزاد سيارات مباشر ومزايدة لحظية", "Flutter، WebSocket، المدفوعات"),
    ("Etgahat Aman", "Safety and security company management app", "Flutter, Firebase, Notifications", "تطبيق إدارة لشركة أمن وسلامة", "Flutter، Firebase، الإشعارات"),
    ("Attendance", "Smart attendance management system", "Flutter, QR Code, Firebase", "نظام ذكي لإدارة الحضور", "Flutter، QR Code، Firebase"),
]

projects_en = [item for name, desc, tech, _, _ in apps for item in (("Heading2", name), (None, f"{desc} | Technologies: {tech}"))]
projects_ar = [item for name, _, _, desc, tech in apps for item in (("Heading2", name), (None, f"{desc} | التقنيات: {tech}"))]

english = [
    ("Title", "Ahmed Motawa"),
    (None, "Flutter & Mobile App Developer"),
    (None, "New Valley, Egypt | Ahmedflutter5590@gmail.com | 0201012766569"),
    ("Heading1", "PROFESSIONAL SUMMARY"),
    (None, "Flutter Developer with 5+ years of experience building and publishing cross-platform mobile applications for Android and iOS. Experienced in scalable app development, clean architecture, state management, Firebase services, and polished user experiences."),
    ("Heading1", "TECHNICAL SKILLS"),
    *[(None, skill) for skill in skills_en],
    ("Heading1", "PROFESSIONAL EXPERIENCE"),
    ("Heading2", "Freelance Flutter Developer | Self-Employed | 2019 - Present"),
    (None, "Develop and publish cross-platform mobile applications for clients across multiple industries."),
    *[(None, "• " + item) for item in achievements_en],
    ("Heading1", "SELECTED PROJECTS"),
    *projects_en,
    ("Heading1", "EDUCATION"),
    ("Heading2", "B.Sc. Computer Science | 2011"),
    (None, "Faculty of Computers & Information, Minya University"),
    (None, "Graduation project: Control PC Via Mobile - Remote desktop control application"),
    ("Heading1", "LANGUAGES"),
    (None, "Arabic: Native | English: Intermediate"),
]
arabic = [
    ("Title", "أحمد مطوع"),
    (None, "مطور Flutter وتطبيقات الجوال"),
    (None, "الوادي الجديد، مصر | Ahmedflutter5590@gmail.com | 0201012766569"),
    ("Heading1", "الملخص المهني"),
    (None, "مطور Flutter بخبرة تزيد عن 5 سنوات في بناء ونشر تطبيقات متعددة المنصات لأندرويد وiOS. خبرة في تطوير التطبيقات القابلة للتوسع، والبنية النظيفة، وإدارة الحالة، وخدمات Firebase، وتجارب الاستخدام المميزة."),
    ("Heading1", "المهارات التقنية"),
    *[(None, skill) for skill in skills_ar],
    ("Heading1", "الخبرة المهنية"),
    ("Heading2", "مطور Flutter مستقل | عمل حر | 2019 - حتى الآن"),
    (None, "تطوير ونشر تطبيقات جوال متعددة المنصات لعملاء في مجالات مختلفة."),
    *[(None, "• " + item) for item in achievements_ar],
    ("Heading1", "مشاريع مختارة"),
    *projects_ar,
    ("Heading1", "التعليم"),
    ("Heading2", "بكالوريوس علوم الحاسب | 2011"),
    (None, "كلية الحاسبات والمعلومات، جامعة المنيا"),
    (None, "مشروع التخرج: التحكم في الكمبيوتر عبر الموبايل - تطبيق للتحكم عن بُعد"),
    ("Heading1", "اللغات"),
    (None, "العربية: اللغة الأم | الإنجليزية: متوسط"),
]

build_pdf("Ahmed_Motawa_CV_EN.pdf", "Ahmed Motawa - ATS-Friendly Resume", english)
build_pdf("Ahmed_Motawa_CV_AR.pdf", "السيرة الذاتية - أحمد مطوع", arabic, rtl=True)
