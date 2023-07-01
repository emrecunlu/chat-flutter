import 'package:chat_client/core/models/user/register/user_register_dto.dart';
import 'package:chat_client/core/repositories/auth/auth_repository.dart';
import 'package:chat_client/core/services/navigation_service.dart';
import 'package:chat_client/core/viewmodels/base_viewmodel.dart';
import 'package:chat_client/locator.dart';
import 'package:chat_client/ui/helpers/form_helper.dart';
import 'package:chat_client/ui/helpers/snackbar_helper.dart';
import 'package:chat_client/ui/views/auth/login/login_view.dart';

class RegisterViewModel extends BaseViewModel {
  final AuthRepository _authRepository = locator<AuthRepository>();
  final FormHelper form = FormHelper({"email", "userName", "password"});

  Future<void> register() async {
    var result = await _authRepository.register(UserRegisterDto.fromJson(form.getJson()));

    if (result == null) return;

    SnackbarHelper.show(title: "Kayıt başarılı, lütfen giriş yapınız.");
    NavigationService.replaceScreen(LoginView());
  }
}
