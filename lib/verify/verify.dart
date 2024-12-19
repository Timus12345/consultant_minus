import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:consult_minus/themes/themes.dart';
import 'package:consult_minus/services/supabase_service.dart';  // Подключаем наш сервис Supabase

class verification_screen extends StatefulWidget {
  const verification_screen({super.key});

  @override
  State<verification_screen> createState() => _verification_screenState();
}

class _verification_screenState extends State<verification_screen> {
  final TextEditingController _otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 290, top: 40),
            child: IconButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/');
              },
              icon: Image.asset(
                'assets/strelka.png',
                width: 50,
                height: 50,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: Text(
              'OTP проверка',
              style: AppShrifts.ralewayBold32.copyWith(color: AppColors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Text(
              "Пожалуйста, Проверьте Свою Электронную Почту, Чтобы Увидеть Код Подтверждения",
              textAlign: TextAlign.center,
              style: AppShrifts.poppinsRegular16.copyWith(color: AppColors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 230, bottom: 20),
            child: Text(
              "OTP Код",
              style: AppShrifts.ralewaySemiBold21.copyWith(color: AppColors.black),
            ),
          ),
          OtpTextField(
            numberOfFields: 6,
            filled: true,
            fieldWidth: 40,
            borderRadius: BorderRadius.circular(10),
            fillColor: AppColors.lightGrey,
            onSubmit: (String otp) async {
              try {
                bool isVerified = await ServiceDatabase.verifyOtp(otp);  // Проверяем OTP
                if (isVerified) {
                  // Операция успешна, перенаправляем пользователя
                  Navigator.pushReplacementNamed(context, '/resetPassword');
                } else {
                  // Ошибка, показываем сообщение
                  showErrorDialog(context, "Неверный код OTP");
                }
              } catch (e) {
                showErrorDialog(context, "Ошибка при верификации OTP: $e");
              }
            },
          ),
        ],
      ),
    );
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: AppColors.white,
          content: Text(
            message,
            style: AppShrifts.poppinsRegular16.copyWith(color: AppColors.red),
          ),
        );
      },
    );
  }
}
