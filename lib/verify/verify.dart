import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:consult_minus/themes/themes.dart';

class verification_screen extends StatelessWidget {
  const verification_screen({super.key});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(6, (index) {
              return Container(
                width: 50,
                height: 50,
                margin: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: AppColors.lightGrey,
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: AppColors.black, width: 2),

                ),
                child: TextField(
                  textAlign: TextAlign.center,
                  keyboardType: TextInputType.number,
                  cursorColor: AppColors.black,
                  maxLength: 1,
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    counterText: '',
                  ),
                  onChanged: (value) {
                  },
                ),
              );
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: Text(
                    "Отправить заново",
                    style: AppShrifts.ralewayRegular12.copyWith(color: AppColors.deepGrey),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "00:30",
                    style: AppShrifts.ralewayRegular12.copyWith(color: AppColors.deepGrey),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
