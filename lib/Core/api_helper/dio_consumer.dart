import 'package:dio/dio.dart';
import 'package:reels/Core/api_helper/api_consumer.dart';

class DioConsumer extends ApiConsumer {

  final Dio dio;

  DioConsumer({required this.dio}) {
    dio.options.baseUrl = 'https://api.sawalef.app/api/v1/';
    dio.interceptors.add(LogInterceptor(
      responseHeader: true,
      responseBody: true,
      requestBody: true,
      request: true,
      requestHeader: true,
      error: true,
    ));
  }

  @override
  Future get(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
  }) async{

    final response = await dio.get(
      path,
      data: data,
      queryParameters: queryParameters,
    );
    return response.data;
  }
}
