 
import 'package:get/get.dart';
import 'package:user/app/controller/pages_controller.dart';

class AppPagesBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => AppPagesController(parser: Get.find()));
  }
}
