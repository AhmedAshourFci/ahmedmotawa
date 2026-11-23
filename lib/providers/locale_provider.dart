import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localeProvider = StateNotifierProvider<LocaleController, Locale>((ref) {
  return LocaleController();
});

class LocaleController extends StateNotifier<Locale> {
  LocaleController() : super(const Locale('en'));

  bool get isArabic => state.languageCode == 'ar';

  void toggle() {
    state = isArabic ? const Locale('en') : const Locale('ar');
  }

  void setLocale(Locale locale) {
    state = locale;
  }
}
