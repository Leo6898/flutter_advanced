import 'package:test_flutter06012024/feature/model/data_state.dart';
import 'package:test_flutter06012024/feature/model/get_topmanga_reponse.dart';
import 'package:test_flutter06012024/feature/network/api/home_api.dart';

class HomeRepository {
  Future<DataState<GetTopMangaResponse?>> getTopManga({
    int page = 1,
    int perPage = 10,
  }) async {
    final responseFromApi = await HomeApi().getTopManga(
      perPage: perPage,
      page: page,
    );

    if (responseFromApi != null) {
      return DataSuccess(data: responseFromApi);
    } else {
      return DataFailed(data: responseFromApi);
    }
  }
}
