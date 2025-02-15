 
import 'package:user/app/backend/api/api.dart';
import 'package:user/app/helper/shared_pref.dart';
import 'package:get/get.dart';
import 'package:user/app/util/constant.dart';

class ContactParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  ContactParser({required this.sharedPreferencesManager, required this.apiService});

  Future<Response> saveContact(dynamic param) async {
    return await apiService.postPrivate(AppConstants.saveaContacts, param, sharedPreferencesManager.getString('token') ?? '');
  }

  Future<Response> sendToMail(dynamic param) async {
    return await apiService.postPrivate(AppConstants.sendMailToAdmin, param, sharedPreferencesManager.getString('token') ?? '');
  }

  String getSupportEmail() {
    return sharedPreferencesManager.getString('supportEmail') ?? '';
  }

  String getName() {
    return sharedPreferencesManager.getString('firstName') ?? '${sharedPreferencesManager.getString('lastName')}';
  }

  String getEmail() {
    return sharedPreferencesManager.getString('email') ?? '';
  }
}
