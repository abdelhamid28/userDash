 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user/app/backend/parse/language_parse.dart';

class LanguageController extends GetxController implements GetxService {
  final LanguagesParser parser;
  late String languageCode;
  LanguageController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    languageCode = parser.getDefault();
  }

  void saveLanguages(String code) {
    var locale = Locale(code.toString());
    Get.updateLocale(locale);
    parser.saveLanguage(code);
    languageCode = code;
    update();
  }
}
