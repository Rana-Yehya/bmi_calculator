import 'package:bmi_calculator/controller/bmi_controller.dart';
import 'package:get/get.dart';

class CustomRootBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BmiController());
  }
}
