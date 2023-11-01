import 'package:al_quran_app/screen/home/home_screen.dart';
import 'package:al_quran_app/screen/login/login_view_model.dart';
import 'package:al_quran_app/utils/shared_preferences_utils.dart';
import 'package:al_quran_app/widgets/text_field_widgets.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<LoginViewModel>(context).initController();
    return Scaffold(
      backgroundColor: const Color(0xffedf2fa),
      appBar: AppBar(
        title: Text(
          'Login Screen',
          style: GoogleFonts.poppins(
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        backgroundColor: const Color(0xffb8e0d4),
        centerTitle: true,
      ),
      body: Consumer<LoginViewModel>(builder: (context, loginViewModel, child) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const SizedBox(
                height: 60,
              ),
              Image.asset(
                'assets/image/Al-Quran.png',
                width: 100,
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldWidgets(
                controller: loginViewModel.usernameController,
                labelText: "Username",
                hintText: "Input your username",
              ),
              const SizedBox(
                height: 16,
              ),
              TextFieldWidgets(
                controller: loginViewModel.passwordController,
                labelText: "Password",
                hintText: "Input your password",
              ),
              const SizedBox(
                height: 16,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xffb8e0d4),
                ),
                onPressed: loginViewModel.isButtonEnabled
                    ? () async {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HomeScreen(),
                          ),
                          (route) => false,
                        );
                        await SharedPreferencesUtils().addToken(
                          loginViewModel.usernameController.text,
                        );
                      }
                    : null,
                child: const Center(
                  child: Text(
                    'Login',
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
