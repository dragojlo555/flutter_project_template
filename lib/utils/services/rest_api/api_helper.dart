import 'package:dio/dio.dart';
import '../../../models/core/failure_model.dart';
import '../../exceptions/repo_exception.dart';

class ApiBaseHelper {
  static const String url = 'BASE_URL';
  static BaseOptions opts = BaseOptions(
    //baseUrl: url,
    connectTimeout: 10000,
    receiveTimeout: 10000,
  );

  static Dio createDio() {
    return Dio(opts);
  }

  static Dio addInterceptors(Dio dio) {
    return dio
      ..interceptors
          .add(InterceptorsWrapper(onRequest: (options, handler) async {
        // Get your JWT token
        print("REQUEST URI: " +
            options.uri.toString() +
            '\n SEND BODY DATA: ' +
            options.data.toString());
        //{options.headers["Authorization"] = "Bearer $token"});
        return handler.next(options); //continue
        // If you want to resolve the request with some custom data，
        // you can resolve a `Response` object eg: return `dio.resolve(response)`.
        // If you want to reject the request with a error message,
        // you can reject a `DioError` object eg: return `dio.reject(dioError)`
      }, onResponse: (response, handler) {
        // Do something with response data
        // print(
        //     "${response.statusCode} ${response.statusMessage} ${response.data}");
        return handler.next(response); // continue
        // If you want to reject the request with a error message,
        // you can reject a `DioError` object eg: return `dio.reject(dioError)`
      }, onError: (DioError e, handler) {
        // Do something with response error
        // print('ON API ERROR ' + e.message);
        // if (e.response?.data != null) {
        //   print('API ERROR: ' + e.response!.data.toString());
        // }
        // return e.response.data; //continue
        return handler.next(e);
        // If you want to resolve the request with some custom data，
        // you can resolve a `Response` object eg: return `dio.resolve(response)`.
      }));
  }

  static dynamic requestInterceptor(RequestOptions options, tokenAccess) {
    options.headers["Authorization"] = "Bearer $tokenAccess";
    return options;
  }

  static final dio = createDio();
  static final baseAPI = addInterceptors(dio);

  Future<Response?> getHTTP(
      String url, Map<String, dynamic>? queryParameters) async {
    Response response;
    try {
      response = await baseAPI.get(url, queryParameters: queryParameters);
      return response;
    } on DioError catch (e) {
      _handleError(e);
    }
  }

  Future<Response?> postHTTP(
    String url,
    dynamic data,
  ) async {
    Response response;
    try {
      response = await baseAPI.post(url, data: data);
      return response;
    } on DioError catch (e) {
      _handleError(e);
    }
  }

  Future<Response?> putHTTP(String url, dynamic data) async {
    Response response;
    try {
      response = await baseAPI.put(url, data: data);
      return response;
    } on DioError catch (e) {
      _handleError(e);
    }
  }

  Future<Response?> patchHTTP(String url, dynamic data) async {
    Response response;
    try {
      response = await baseAPI.patch(url, data: data);
      return response;
    } on DioError catch (e) {
      _handleError(e);
    }
  }

  Future<Response?> deleteHTTP(String url) async {
    Response response;
    try {
      response = await baseAPI.delete(url);
      return response;
    } on DioError catch (e) {
      _handleError(e);
    }
  }

  _handleError(e) {
    String message = e.response.toString();
    int code = 500;
    String key = 'Something wrong on server';
    try {
      message = e.response != null &&
              e.response.data != null &&
              e.response.data['message'] != null
          ? e.response.data['message']
          : "Something went wrong";
      key = e.response != null &&
              e.response.data != null &&
              e.response.data['key'] != null
          ? e.response.data['key']
          : "UNKNOWN";
      code = e.response != null && e.response?.statusCode != null
          ? e.response.statusCode
          : 1000;
    } catch (ex) {
      throw RepoException(
          message: 'Error during parse repo exception',
          failure:
              const Failure(code: 501, message: 'Error', key: 'PARSE_ERROR'));
    }
    throw RepoException(
        message: e.message,
        failure: Failure(code: code, message: message, key: key));
  }
}
