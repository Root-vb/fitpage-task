import '../dto/base_data.dart';

class BaseDataResponse {
  List<HomeData>? data;

  BaseDataResponse({this.data});

  BaseDataResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <HomeData>[];
      json['data'].forEach((v) {
        data!.add(new HomeData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
