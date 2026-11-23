import 'package:flutter/material.dart';

class LocalizedText {
  final String en;
  final String ar;

  const LocalizedText({required this.en, required this.ar});

  String of(Locale locale) => locale.languageCode == 'ar' ? ar : en;
}

class AppModel {
  final String name;
  final LocalizedText description;
  final String categoryKey;
  final List<String> screenshots;
  final String? appStoreUrl;
  final String? playStoreUrl;
  final List<String> technologies;
  final String? clientName;
  final String? year;

  const AppModel({
    required this.name,
    required this.description,
    required this.categoryKey,
    required this.screenshots,
    this.appStoreUrl,
    this.playStoreUrl,
    required this.technologies,
    this.clientName,
    this.year,
  });
}

class SkillModel {
  final String name;
  final double proficiency;
  final IconData icon;
  final String categoryKey;

  const SkillModel({
    required this.name,
    required this.proficiency,
    required this.icon,
    required this.categoryKey,
  });
}

class ExperienceModel {
  final LocalizedText title;
  final LocalizedText company;
  final LocalizedText duration;
  final LocalizedText description;
  final List<LocalizedText> achievements;

  const ExperienceModel({
    required this.title,
    required this.company,
    required this.duration,
    required this.description,
    required this.achievements,
  });
}

class EducationModel {
  final LocalizedText degree;
  final LocalizedText institution;
  final String year;
  final String? gpa;
  final LocalizedText? project;

  const EducationModel({
    required this.degree,
    required this.institution,
    required this.year,
    this.gpa,
    this.project,
  });
}

class ContactModel {
  final String typeKey;
  final String value;
  final String url;
  final IconData icon;

  const ContactModel({
    required this.typeKey,
    required this.value,
    required this.url,
    required this.icon,
  });
}
