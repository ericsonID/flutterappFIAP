import 'package:get/get.dart';

import '../model/assist.dart';
import '../services/assists_service.dart';

class AssistController extends GetxController with StateMixin<List<Assist>>{
late AssistsService _service;
  List<Assist> allAssists = [];
  List<Assist> selectAssists = [];

  @override
  void onInit() {
    super.onInit();
    _service = Get.find<AssistsService>();
    getAssistList();
  }

  @override
  void onReady() {
    super.onReady();
    selectAssists = Get.arguments;
  }
  
   

  void getAssistList() {
    change([], status: RxStatus.loading());
    _service.getAssists().then((value) {
      allAssists = value;
      change(value, status: RxStatus.success());
    }).onError((error, stackTrace) {
      change([], status: RxStatus.error(error.toString()));
    });
  }

  void finishSelectAssist() {
    Get.back();
  }

  void selectAssist(int index) {
    Assist assistance = allAssists[index];
    int indexFound =
        selectAssists.indexWhere((element) => element.id == assistance.id);
    if (indexFound == -1) {
      selectAssists.add(assistance);
    } else {
      selectAssists.removeAt(indexFound);
    }

    change(allAssists, status: RxStatus.success());
  }

  bool isSelected(int index) {
    Assist assistance = allAssists[index];
    int indexFound =
        selectAssists.indexWhere((element) => element.id == assistance.id);
    if (indexFound >= 0) {
      return true;
    }
    return false;
  }
}