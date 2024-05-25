 
import 'package:user/app/backend/api/api.dart';
import 'package:user/app/helper/shared_pref.dart';
import 'package:get/get.dart';
import 'package:user/app/util/constant.dart';

class LearningDetailsParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  LearningDetailsParser({required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getDetails(int id) async {
    return apiService.postPrivate(AppConstants.getLearningDetails, {"id": id}, sharedPreferencesManager.getString('token') ?? '');
  }
}
