import 'package:chat_client/core/repositories/auth/auth_repository.dart';
import 'package:chat_client/core/services/api_service.dart';
import 'package:chat_client/core/viewmodels/auth/login_viewmodel.dart';
import 'package:chat_client/core/viewmodels/auth/register_viewmodel.dart';
import 'package:chat_client/core/viewmodels/chat/chat_viewmodel.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerSingleton<ApiService>(ApiService());
  locator.registerSingleton<AuthRepository>(AuthRepository());

  locator.registerFactory<LoginViewModel>(() => LoginViewModel());
  locator.registerFactory<RegisterViewModel>(() => RegisterViewModel());
  locator.registerFactory<ChatViewModel>(() => ChatViewModel());
}
