 
import 'package:get/get.dart';
import 'package:user/app/controller/splash_controller.dart';
import 'package:user/app/helper/router.dart';
import 'package:user/app/util/toast.dart';

class ApiChecker {
  static void checkApi(Response response) {
    print(" ******** inside check api ${response.statusCode}") ;
    print(" ******** inside check api ${response.statusText.toString()}") ;
    print(" ******** inside check api ${response.request.toString()}") ;
    if (response.statusCode == 401) {
      showToast('Session expired!'.tr);
      Get.find<SplashController>().removeCreds();
      Get.offNamed(AppRouter.getLoginRoutes());
    } else {
      showToast(response.statusText.toString().tr);
    }
  }
}
