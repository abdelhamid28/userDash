 
import 'package:get/get.dart';
import 'package:user/app/controller/winner_controller.dart';

class WinnerBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => WinnerController(parser: Get.find()));
  }
}
