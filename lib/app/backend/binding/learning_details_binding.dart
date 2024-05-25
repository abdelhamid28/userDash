 
import 'package:get/get.dart';
import 'package:user/app/controller/learning_details_controller.dart';

class LearningDetailsBindings extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => LearningDetailsController(parser: Get.find()));
  }
}
