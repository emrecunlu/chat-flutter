import 'package:chat_client/core/models/base_model.dart';
import 'package:chat_client/core/models/common/api_results/api_error_result.dart';
import 'package:chat_client/core/models/common/api_results/api_post_object_result.dart';
import 'package:chat_client/core/models/common/api_results/api_post_result.dart';
import 'package:chat_client/ui/helpers/snackbar_helper.dart';
import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';

class ApiService {
  final dio = Dio(BaseOptions(baseUrl: "http://localhost:5555/api"))
    ..interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (e, handler) {
          if (e.response != null) {
            final errorResult = ApiErrorResult.fromJson(e.response!.data);

            SnackbarHelper.show(title: errorResult.message);
          }

          return handler.next(e);
        },
      ),
    );

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
