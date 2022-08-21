import 'package:get/get.dart';
import 'package:starter/app/data/repository/home_repository.dart';
import 'package:starter/base/base_controller.dart';

import '../../../data/models/dto/base_data.dart';

class HomeController extends BaseController<HomeRepository> {
  var homePageData = <HomeData?>[].obs;

  @override
  void onInit() {
    getDashboardData();
    super.onInit();
  }

  @override
  void onClose() {}

  void getDashboardData() {
    repository.getData().then((response) {
      if (response.data != null) {
        print("Checking Data : $response");
        response.data?.data?.forEach((element) {
          homePageData.add(element);
        });
      } else {
        print("Checking Error : $response");
        //show Error
      }
    }, onError: (error) {
      print("Checking Error 2 : $error");
    });
  }
}
