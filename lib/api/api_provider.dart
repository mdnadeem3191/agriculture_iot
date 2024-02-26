import 'package:agriculture_web/api/base_url.dart';
import 'package:agriculture_web/repository/main_dashboard_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
part 'api_provider.g.dart';

// flutter pub run build_runner build --delete-conflicting-outputs
//flutter run --dart-define url="dev" or "prod"

@RestApi()
abstract class ApiProvider {
  factory ApiProvider(Dio dio, {String baseUrl}) = _ApiProvider;
  @GET("channels/1986745/feed.json")
  Future<MainDashBoardModel> getDashBoardData(
    @Query('api_key') String apiKey,
    @Query('results') String result,
  );
}

class UserRepository {
  late ApiProvider _apiProvider;
  late Dio _dio;
  UserRepository() {
    _dio = Dio();
    _apiProvider = ApiProvider(_dio, baseUrl: BaseUrl.baseurl);
  }
  Future<MainDashBoardModel> userLogin() async {
    return await _apiProvider.getDashBoardData("LLOGFGBE7MQYGUO7", "10");
  }
}
