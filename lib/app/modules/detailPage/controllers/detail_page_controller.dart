import 'package:get/get.dart';
import 'package:starter/app/data/models/dto/base_data.dart';

class DetailPageController extends GetxController {
  //TODO: Implement DetailPageController

  var pageData = HomeData();

  @override
  void onInit() {
    dynamic data = Get.arguments;
    if (data != null) {
      pageData = data['homeData'];
    }
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
