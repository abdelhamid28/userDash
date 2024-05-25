 
import 'package:get/get.dart';
import 'package:user/app/controller/language_controller.dart';

class LanguageBinding extends Bindings {
  @override
  void dependencies() async {
    Get.lazyPut(() => LanguageController(parser: Get.find()));
  }
}
