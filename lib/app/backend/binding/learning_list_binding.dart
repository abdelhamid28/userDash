 
import 'package:get/get.dart';
import 'package:user/app/controller/learning_list_controller.dart';

class LearningListBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => LearningListController(parser: Get.find()));
  }
}
