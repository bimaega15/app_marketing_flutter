import 'package:flutter/material.dart';

import '../../components/no_account_text.dart';
import '../../components/socal_card.dart';
import 'components/sign_form.dart';

class SignInScreen extends StatelessWidget {
  static String routeName = "/sign_in";

  const SignInScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Aplikasi"),
      ),
      body: const SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 16),
                  Text(
                    "Selamat Datang Kembali",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "Login dengan Username Atau Email \n dan Password Kamu",
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 16),
                  SignForm(),
                  SizedBox(height: 16),
                  SizedBox(height: 20),
                  NoAccountText(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
