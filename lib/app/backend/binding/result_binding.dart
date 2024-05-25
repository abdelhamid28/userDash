 
import 'package:get/get.dart';
import 'package:user/app/controller/result_controller.dart';

class ResultBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => ResultController(parser: Get.find()));
  }
}
