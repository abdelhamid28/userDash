 
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:user/app/backend/api/handler.dart';
import 'package:user/app/backend/models/language_model.dart';
import 'package:user/app/backend/models/settings_model.dart';
import 'package:user/app/backend/models/support_model.dart';
import 'package:user/app/backend/parse/splash_parse.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:user/app/util/toast.dart';

class SplashController extends GetxController implements GetxService {
  final SplashParser parser;
  late LanguageModel _defaultLanguage;
  LanguageModel get defaultLanguage => _defaultLanguage;
  SplashController({required this.parser});

  @override
  void onInit() {
    super.onInit();
    if (!kIsWeb) {
      FirebaseMessaging.instance.getToken().then((value) {
        debugPrint(value.toString());
        parser.saveDeviceToken(value.toString());
      });
      FirebaseMessaging.onMessage.handleError((error) {
        showToast("Erorrrrrr : ${error.toString()}");
      }).listen((event) {
        notificationDialog(event.notification!.title.toString(), event.notification!.body.toString()).then((value) => debugPrint(value.toString()));
      });
    }
  }

  bool showLogin() {
    return parser.showLoggedIn();
  }

  Future<bool> initSharedData() {
    return parser.initAppSettings();
  }

  void removeCreds() {
    parser.removeCreds();
  }

  Future<bool> getConfigData() async {
    print(" ******** start getConfigData") ;
    Response response = await parser.getAppSettings();
      print(" ******** response $response") ;
    bool isSuccess = false;
    if (response.statusCode == 200) {
       print(" ******** response is OK  ${response.status.code}") ;
      Map<String, dynamic> myMap = Map<String, dynamic>.from(response.body);
      if (myMap['data'] != null) {
        dynamic data = myMap["data"];
        dynamic admin = myMap["admin"];
        print(" ******** response ${response.body}") ;
        if (data != null && admin != null) {
          SettingsModel appSettingsInfo = SettingsModel.fromJson(data);

          SupportModel supportModelInfo = SupportModel.fromJson(admin);

          parser.saveBasicInfo(supportModelInfo.email, appSettingsInfo.name, supportModelInfo.firstName, supportModelInfo.id, supportModelInfo.mobile);
          isSuccess = true;
        } else {
          isSuccess = false;
        }
      }
    } else {
      print(" ******** start check api ${response}") ;
      ApiChecker.checkApi(response);
      isSuccess = false;
    }
    update();
    return isSuccess;
  }

  String getLanguageCode() {
    return parser.getLanguagesCode();
  }
}
