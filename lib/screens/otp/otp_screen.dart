import 'package:flutter/material.dart';
import 'package:shop_app/screens/init_screen.dart';

import '../../constants.dart';

import 'components/otp_form.dart';

class OtpScreen extends StatelessWidget {
  static String routeName = "/otp";

  const OtpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verifikasi OTP"),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 16),
                const Text(
                  "Verifikasi OTP",
                  style: headingStyle,
                ),
                const Text("Kode terkirim ke No. +1 898 860 ***"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Kode ini akan expired pada "),
                    TweenAnimationBuilder(
                      tween: Tween(begin: 30.0, end: 0.0),
                      duration: const Duration(seconds: 30),
                      builder: (_, dynamic value, child) => Text(
                        "00:${value.toInt()}",
                        style: const TextStyle(color: kPrimaryColor),
                      ),
                    ),
                  ],
                ),
                const OtpForm(),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    // OTP code resend
                  },
                  child: const Text(
                    "Kirim ulang kode OTP",
                    style: TextStyle(decoration: TextDecoration.underline),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
