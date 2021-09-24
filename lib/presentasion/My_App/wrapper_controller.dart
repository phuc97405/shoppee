import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:shoppee/presentasion/Home/home.dart';

class WrapperController extends GetxController {
  RxBool goToHome = false.obs;
  @override
  void onInit() async {
    Future.delayed(const Duration(seconds: 3), () {
      goToHome.value = true;
      Get.off(() => HomePage());
    });
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
