import 'package:flutter/material.dart';
import 'package:consult_minus/themes/themes.dart';
import 'package:consult_minus/services/supabase_service.dart';  // Подключаем наш сервис Supabase

class forgot_pass extends StatefulWidget {
  const forgot_pass({super.key});

  @override
  State<forgot_pass> createState() => _forgot_passState();
}

class _forgot_passState extends State<forgot_pass> {
  final TextEditingController _emailController = TextEditingController();

  bool obscureText = true;

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
            padding: const EdgeInsets.only(left: 0, right: 10, top: 20),
            child: Text(
              'Забыл Пароль',
              style: AppShrifts.ralewayBold32.copyWith(color: AppColors.black),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 60, right: 60, top: 10),
            child: Text(
              'Введите Свою Учетную Запись Для Сброса',
              textAlign: TextAlign.center,
              style: AppShrifts.poppinsRegular16.copyWith(color: AppColors.grey),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
            child: TextField(
              controller: _emailController,
              cursorColor: AppColors.black,
              decoration: InputDecoration(
                fillColor: AppColors.lightGrey,
                filled: true,
                hintText: 'xyz@gmail.com',
                hintStyle: AppShrifts.poppinsMedium14.copyWith(color: AppColors.darkGrey.withOpacity(0.6)),
                border: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    borderSide: BorderSide.none),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
            child: ElevatedButton(
              onPressed: () async {
                String email = _emailController.text.trim();
                if (email.isNotEmpty) {
                  try {
                    await ServiceDatabase.sendOtp(email);  // Отправляем OTP
                    showForgotPasswordDialog(context);
                  } catch (e) {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: AppColors.white,
                          content: Text(
                            "Ошибка при отправке OTP: $e",
                            style: AppShrifts.poppinsRegular16.copyWith(color: AppColors.red),
                          ),
                        );
                      },
                    );
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.black,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                minimumSize: const Size(400, 50),
              ),
              child: Text(
                'Отправить',
                style: AppShrifts.ralewaySemiBold14.copyWith(color: AppColors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void showForgotPasswordDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: AppColors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "Проверьте Ваш Email",
                textAlign: TextAlign.center,
                style: AppShrifts.ralewayBold16.copyWith(color: AppColors.black),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0),
              child: Text(
                "Мы Отправили Код Восстановления Пароля На Вашу Электронную Почту.",
                textAlign: TextAlign.center,
                style: AppShrifts.poppinsRegular16.copyWith(color: AppColors.grey),
              ),
            ),
          ],
        ),
      );
    },
  );

  Future.delayed(const Duration(seconds: 3), () {
    Navigator.of(context).pushReplacementNamed('/verify');
  });
}
