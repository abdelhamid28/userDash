 
import 'package:user/app/backend/api/api.dart';
import 'package:user/app/helper/shared_pref.dart';

class ResultParser {
  final SharedPreferencesManager sharedPreferencesManager;
  final ApiService apiService;

  ResultParser({required this.sharedPreferencesManager, required this.apiService});
}
