 
import 'package:get/get.dart';
import 'package:user/app/controller/exam_paper_controller.dart';

class ExamPaperBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => ExamPaperController(parser: Get.find()));
  }
}
