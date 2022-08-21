import 'dart:convert';

import 'package:starter/app/data/models/dto/response.dart';
import 'package:starter/app/data/models/response/user_response.dart';
import 'package:starter/app/data/values/urls.dart';
import 'package:starter/base/base_repository.dart';
import 'package:starter/utils/helper/exception_handler.dart';

class HomeRepository extends BaseRepository {
  Future<RepoResponse<BaseDataResponse>> getData() async {
    final response = await controller.get(path: URLs.getData);
    print("HomeRepository Response : $response");
    var newData = json.decode("{\"data\" : ${json.encode(response)} }");
    return response is APIException
        ? RepoResponse(error: response)
        : RepoResponse(data: BaseDataResponse.fromJson(newData));
  }
}
