 
import 'package:get/get.dart';
import 'package:user/app/controller/exam_list_controller.dart';

class ExamListBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => ExamListController(parser: Get.find()));
  }
}
