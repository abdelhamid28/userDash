 
import 'package:user/app/backend/api/api.dart';
import 'package:user/app/helper/shared_pref.dart';
import 'package:get/get.dart';
import 'package:user/app/util/constant.dart';

class ExamStatsParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  ExamStatsParser({required this.sharedPreferencesManager, required this.apiService});

  Future<Response> getExamStats(int examId) async {
    return apiService.postPrivate(AppConstants.getMyExamStats, {"exam_id": examId, "uid": sharedPreferencesManager.getString('uid')}, sharedPreferencesManager.getString('token') ?? '');
  }
}
