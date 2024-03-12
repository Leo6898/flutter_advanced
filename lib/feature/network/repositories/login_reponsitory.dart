import 'package:test_flutter06012024/feature/model/data_state.dart';
import 'package:test_flutter06012024/feature/model/login_reponse.dart';
import 'package:test_flutter06012024/feature/model/login_request.dart';
import 'package:test_flutter06012024/feature/network/api/login_api.dart';

class LoginRepository {
  Future<DataState<LoginResponseModel?>> login(LoginRequest request) async {
    final responseFromApi = await LoginApi().login(request);
    if (responseFromApi != null) {
      return DataSuccess(data: responseFromApi);
    } else {
      return DataFailed(data: responseFromApi);
    }
  }
}
