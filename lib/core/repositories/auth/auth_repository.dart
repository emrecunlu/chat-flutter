import 'package:chat_client/core/models/auth/token_model.dart';
import 'package:chat_client/core/models/common/api_results/api_post_object_result.dart';
import 'package:chat_client/core/models/user/login/user_signin_dto.dart';
import 'package:chat_client/core/services/api_service.dart';
import 'package:chat_client/locator.dart';

class AuthRepository {
  final ApiService _apiService = locator<ApiService>();
  final String _baseUrl = "/auth";

  Future<ApiPostObjectResult<TokenModel>?> signIn(UserSigninDto model) async {
    return await _apiService.postObject('$_baseUrl/login', model.toJson(), TokenModel());
  }
}
