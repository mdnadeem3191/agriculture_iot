import 'package:agriculture_web/api/api_provider.dart';
import 'package:agriculture_web/api/base_url.dart';
import 'package:dio/dio.dart';

class UserRepository {
  late ApiProvider _apiProvider;
  late Dio _dio;
  UserRepository() {
    _dio = Dio();
    _apiProvider = ApiProvider(_dio, baseUrl: BaseUrl.baseurl);
  }
}
