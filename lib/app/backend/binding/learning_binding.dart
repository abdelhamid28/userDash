 
import 'package:get/get.dart';
import 'package:user/app/controller/learning_controller.dart';

class LearningBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => LearningController(parser: Get.find()));
  }
}
