import '../dto/base_data.dart';

class BaseDataResponse {
  List<HomeData>? data;

  BaseDataResponse({this.data});

  BaseDataResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <HomeData>[];
      json['data'].forEach((v) {
        data!.add(HomeData.fromJson(v));
      });
    }
  }
}
