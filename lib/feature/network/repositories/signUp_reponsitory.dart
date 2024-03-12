import 'package:test_flutter06012024/feature/model/signUp_reponse.dart';
import 'package:test_flutter06012024/feature/model/signup_request.dart';
import 'package:test_flutter06012024/feature/network/api/signup_api.dart';

class SignUpReponsitory {
  Future<SignUpResponseModel?> signUp(SignUpRequest signUpRequest) async {
    final responseFromApi = await SignUpApi().signUp(signUpRequest);
    return null;
  }
}
