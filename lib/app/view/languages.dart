 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user/app/controller/language_controller.dart';
import 'package:user/app/util/constant.dart';
import 'package:user/app/util/theme.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LanguageController>(
      builder: (value) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: ThemeProvider.appColor,
            elevation: 0,
            centerTitle: false,
            automaticallyImplyLeading: true,
            title: Text('Languages'.tr, style: ThemeProvider.titleStyle),
            leading: IconButton(icon: const Icon(Icons.arrow_back, color: ThemeProvider.whiteColor), onPressed: () => Get.back()),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                for (var language in AppConstants.languages)
                  ListTile(
                    title: Text(language.languageName),
                    leading: Radio(
                      value: language.languageCode,
                      groupValue: value.languageCode,
                      onChanged: (e) => value.saveLanguages(e.toString()),
                    ),
                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
