import 'package:get/instance_manager.dart';
import 'package:shoppee/presentasion/Home/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
