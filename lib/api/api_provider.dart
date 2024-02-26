import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_provider.g.dart';
// flutter pub run build_runner build --delete-conflicting-outputs
//flutter run --dart-define url="dev" or "prod"

@RestApi()
abstract class ApiProvider {
  factory ApiProvider(Dio dio, {String baseUrl}) = _ApiProvider;
}
