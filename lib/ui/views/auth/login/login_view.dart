import 'package:chat_client/core/viewmodels/auth/login_viewmodel.dart';
import 'package:chat_client/ui/views/base_view.dart';
import 'package:chat_client/ui/widgets/button/circle_button.dart';
import 'package:chat_client/ui/widgets/common/base_widget.dart';
import 'package:chat_client/ui/widgets/textfield/filled_textfield.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends BaseWidget<LoginView> {
  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(24),
                width: double.infinity,
                height: dynamicHeight(1),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildImage(),
                    SizedBox(height: 50),
                    _buildForm(onSubmit: model.signIn, controllers: model.form.fields),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildImage() {
    return Image(
      width: double.infinity,
      height: dynamicHeight(.35),
      fit: BoxFit.cover,
      image: AssetImage("assets/images/login-illustration.jpg"),
    );
  }

  Widget _buildNavigationTile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Hesabınız yok mu?"),
        SizedBox(width: 5),
        GestureDetector(
          onTap: () {},
          child: Text(
            "kayıt ol.",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: themeData.primaryColor,
            ),
          ),
        )
      ],
    );
  }

  Widget _buildFormTile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Giriş Yap",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: themeData.primaryColor,
            fontSize: 24,
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Giriş yapabilmek için lütfen formu doldurunuz.",
          style: TextStyle(
            fontSize: 15,
            color: Colors.grey.shade600,
          ),
        )
      ],
    );
  }

  Widget _buildForm(
      {required VoidCallback onSubmit, required Map<String, TextEditingController> controllers}) {
    return Expanded(
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFormTile(),
            SizedBox(height: 30),
            FilledTextField(
              title: "E-posta Adresi",
              controller: controllers["email"],
            ),
            SizedBox(
              height: 20,
            ),
            FilledTextField(
              title: "Şifre",
              secure: true,
              controller: controllers["password"],
            ),
            SizedBox(height: 30),
            CircleButton(
              title: "Giriş Yap",
              icon: Icon(
                Icons.login,
                color: Colors.white,
              ),
              onPress: onSubmit,
            ),
            SizedBox(height: 40),
            _buildNavigationTile(),
          ],
        ),
      ),
    );
  }
}
