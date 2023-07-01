import 'package:chat_client/core/services/api_service.dart';
import 'package:chat_client/core/services/navigation_service.dart';
import 'package:chat_client/core/services/storage_service.dart';
import 'package:chat_client/locator.dart';
import 'package:chat_client/ui/views/auth/login/login_view.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

class AuthHelper {
  static final StorageService _storageService = StorageService.instance;
  static final ApiService _apiService = locator<ApiService>();

  static String getDisplayName() {
    print(JwtDecoder.decode(_storageService.getString("token")).toString());
    return JwtDecoder.decode(_storageService.getString("token"))["displayName"] ?? "";
  }

  static Future<String?> refreshToken() async {
    try {
      var result =
          await _apiService.dio.get('/auth/token/${_storageService.getString("refreshToken")}');

      return result.data["data"] ?? "";
    } catch (e) {
      return null;
    }
  }

  static Future<void> logout() async {
    await StorageService.instance.remove("token");
    await StorageService.instance.remove("refreshToken");

    NavigationService.closeAll(LoginView());
  }
}
