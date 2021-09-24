import 'package:get/instance_manager.dart';
import 'package:shoppee/presentasion/My_App/wrapper_controller.dart';

class WrapperBingding extends Bindings {
  @override
  void dependencies() {
    Get.put(WrapperController());
  }
}
