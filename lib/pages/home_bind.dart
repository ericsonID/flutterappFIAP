
import 'package:appabctech/controller/controller_assists.dart';
import 'package:get/instance_manager.dart';

class HomeBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssistController>(() => AssistController());
  }
}