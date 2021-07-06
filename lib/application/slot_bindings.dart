import 'package:get/get.dart';
import 'package:slot_machine/application/slot_controller.dart';

class SlotBindings implements Bindings {
  @override
  void dependencies() {
    Get.put(
      SlotController(),
    );
  }
}
