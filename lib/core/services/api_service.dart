import 'package:chat_client/core/models/base_model.dart';
import 'package:chat_client/core/models/common/api_results/api_error_result.dart';
import 'package:chat_client/core/models/common/api_results/api_post_object_result.dart';
import 'package:chat_client/core/models/common/api_results/api_post_result.dart';
import 'package:chat_client/core/services/storage_service.dart';
import 'package:chat_client/ui/helpers/auth_helper.dart';
import 'package:chat_client/ui/helpers/snackbar_helper.dart';
import 'package:dio/dio.dart';

class ApiService {
  final dio = Dio(BaseOptions(baseUrl: "http://localhost:5555/api"));

  ApiService() {
    dio
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) {
            options.headers["Authorization"] =
                'Bearer ${StorageService.instance.getString("token")}';
            return handler.next(options);
          },
          onResponse: (e, handler) {
            handler.resolve(e);
          },
          onError: (e, handler) async {
            if (e.response?.statusCode == 401) {
              var accesToken = await AuthHelper.refreshToken();

              if (accesToken != null) {
                e.requestOptions.headers["Authorization"] = 'Bearer ${accesToken}';
                StorageService.instance.setString("token", accesToken);

                return handler.resolve(await dio.fetch(e.requestOptions));
              }
            } else if (e.response?.statusCode == 403) {
              SnackbarHelper.show(title: "Oturum süresi doldu.");
              await AuthHelper.logout();

              return;
            }

            if (e.response != null) {
              var errorResult = ApiErrorResult.fromJson(e.response!.data);

              SnackbarHelper.show(title: errorResult.message);
            } else {
              SnackbarHelper.show(title: e.message ?? "Hata meydana geldi!");
            }

            handler.reject(e);
          },
        ),
      );
  }

  Future<ApiPostResult?> post(String url, dynamic obj) async {
    try {
      var response = await dio.post(url, data: obj);

      return ApiPostResult.fromJson(response.data);
    } catch (e) {
      return null;
    }
  }

  Future<ApiPostObjectResult<T>?> postObject<T extends BaseModel<T>>(
      String url, dynamic obj, BaseModel resultModel) async {
    try {
      var response = await dio.post(url, data: obj);

      return ApiPostObjectResult<T>.fromJson(response.data, resultModel);
    } catch (e) {
      return null;
    }
  }
}
