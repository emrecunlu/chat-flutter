import 'package:chat_client/core/models/user/login/user_signin_dto.dart';
import 'package:chat_client/core/repositories/auth/auth_repository.dart';
import 'package:chat_client/core/services/navigation_service.dart';
import 'package:chat_client/core/services/storage_service.dart';
import 'package:chat_client/core/viewmodels/base_viewmodel.dart';
import 'package:chat_client/locator.dart';
import 'package:chat_client/ui/helpers/form_helper.dart';
import 'package:chat_client/ui/views/chat/chat/chat_view.dart';

class LoginViewModel extends BaseViewModel {
  final StorageService _storageService = StorageService.instance;
  final AuthRepository _authRepository = locator<AuthRepository>();
  final FormHelper form = FormHelper({"email", "password"});

  Future<void> signIn() async {
    var result = await _authRepository.signIn(UserSigninDto.fromJson(form.getJson()));

    if (result == null) return;

    await _storageService.setString("token", result.data!.accessToken);
    await _storageService.setString("refreshToken", result.data!.refreshToken);

    NavigationService.replaceScreen(ChatView());
  }
}
