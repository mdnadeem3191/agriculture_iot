import 'package:agriculture_web/repository/main_dashboard_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_provider.g.dart';
// flutter pub run build_runner build --delete-conflicting-outputs
//flutter run --dart-define url="dev" or "prod"

@RestApi()
abstract class ApiProvider {
  factory ApiProvider(Dio dio, {String baseUrl}) = _ApiProvider;

  @GET("1986745/feed.json?api_key=LLOGFGBE7MQYGUO7")
  Future<MainDashBoardModel> getDashBoardData();
}

class UserRepository {
  late ApiProvider _apiProvider;
  late Dio _dio;

  Future<MainDashBoardModel> userLogin() async {
    return await _apiProvider.getDashBoardData();
  }
}
