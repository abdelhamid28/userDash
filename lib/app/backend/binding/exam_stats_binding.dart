 
import 'package:get/get.dart';
import 'package:user/app/controller/exam_stats_controller.dart';

class ExamStatsBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => ExamStatsController(parser: Get.find()));
  }
}
