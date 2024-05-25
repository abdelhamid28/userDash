 
import 'package:user/app/backend/api/api.dart';
import 'package:user/app/helper/shared_pref.dart';
import 'package:get/get.dart';
import 'package:user/app/util/constant.dart';

class LearningParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  LearningParser({required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getMySubjects() async {
    return apiService.postPrivate(
        AppConstants.getMySubjects, {"study_id": sharedPreferencesManager.getInt('studyId'), "term_id": sharedPreferencesManager.getInt('termId')}, sharedPreferencesManager.getString('token') ?? '');
  }
}
