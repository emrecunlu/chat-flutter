import 'package:chat_client/core/models/user/login/user_signin_dto.dart';
import 'package:chat_client/core/repositories/auth/auth_repository.dart';
import 'package:chat_client/core/viewmodels/base_viewmodel.dart';
import 'package:chat_client/locator.dart';
import 'package:chat_client/ui/helpers/form_helper.dart';
import 'package:flutter/widgets.dart';

class LoginViewModel extends BaseViewModel {
  final AuthRepository _authRepository = locator<AuthRepository>();
  final FormHelper form = FormHelper({"email", "password"});
  int counter = 1;

  Future<void> signIn() async {
    var result = await _authRepository.signIn(UserSigninDto.fromJson(form.getJson()));

    debugPrint(result.toString());
  }
}
