import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:test_flutter06012024/feature/model/signUp_reponse.dart';
import 'package:test_flutter06012024/feature/model/signup_request.dart';

class SignUpApi {
  Future<SignUpResponseModel?> signUp(
    SignUpRequest requestSign,
  ) async {
    var headers = {
      'x-api-key':
          '70acd5355eaf206e332857ab6642e9c7efebee7538c125eaf04072ed912c77c0dc180fde7d8e3b9d116b51d54d560a4bb01b6dc4592174f5ba430bdcbb2393b2',
      'Content-Type': 'application/json'
    };
    // var data = json.encode({
    //   "name": "Ngo Quang Hung",
    //   "email": "hungnq10@gmail.com",
    //   "password": "abc12"
    // });
    var dio = Dio();
    var response = await dio.request(
      'https://flutter08.onrender.com/v1/api/shop/signup',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: requestSign.toJson(),
    );

    if (response.statusCode == 200) {
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
    return null;
  }
}
