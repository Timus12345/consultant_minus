import 'package:flutter/material.dart';
import 'package:consult_minus/themes/themes.dart';
import 'package:consult_minus/services/supabase_service.dart';

class reg_screen extends StatefulWidget {
  const reg_screen({super.key});

  @override
  State<reg_screen> createState() => _reg_screenState();
}

class _reg_screenState extends State<reg_screen> {
  bool obscureText = true;
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  String errorMessage = ''; // Переменная для отображения ошибки

  // Функция для обработки регистрации
  Future<void> _register() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        errorMessage = ''; // Сброс ошибки перед новым запросом
      });

      try {
        await SupabaseService.signUp(
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
        // Можно добавить код для сохранения имени пользователя в профиль
        Navigator.pushReplacementNamed(context, '/home');  // Переход на главную страницу
      } catch (e) {
        setState(() {
          errorMessage = 'Ошибка регистрации: $e';  // Отображение ошибки
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(right: 290, top: 100),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0, top: 10),
              child: Text(
                'Создать аккаунт',
                style: AppShrifts.ralewayBold32.copyWith(color: AppColors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30, right: 30, top: 10),
              child: Text(
                'Добро пожаловать!',
                textAlign: TextAlign.center,
                style: AppShrifts.poppinsRegular16.copyWith(color: AppColors.grey),
              ),
            ),
            // Форма с полями
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Поле для имени
                  Padding(
                    padding: const EdgeInsets.only(right: 280, top: 10),
                    child: Text(
                      'Имя',
                      style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: TextFormField(
                      controller: _nameController,
                      cursorColor: AppColors.black,
                      decoration: InputDecoration(
                        fillColor: AppColors.lightGrey,
                        filled: true,
                        hintText: 'ФИО',
                        hintStyle: AppShrifts.poppinsMedium14.copyWith(
                          color: AppColors.darkGrey.withOpacity(0.6),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите ваше имя';
                        }
                        return null;
                      },
                    ),
                  ),
                  // Поле для email
                  Padding(
                    padding: const EdgeInsets.only(right: 270, top: 10),
                    child: Text(
                      'Email',
                      style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: TextFormField(
                      controller: _emailController,
                      cursorColor: AppColors.black,
                      decoration: InputDecoration(
                        fillColor: AppColors.lightGrey,
                        filled: true,
                        hintText: 'xyz@gmail.com',
                        hintStyle: AppShrifts.poppinsMedium14.copyWith(
                          color: AppColors.darkGrey.withOpacity(0.6),
                        ),
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите email';
                        }
                        return null;
                      },
                    ),
                  ),
                  // Поле для пароля
                  Padding(
                    padding: const EdgeInsets.only(right: 250, top: 15),
                    child: Text(
                      'Пароль',
                      style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20, top: 15),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: obscureText,
                      obscuringCharacter: '·',
                      cursorColor: AppColors.black,
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              obscureText = !obscureText;
                            });
                          },
                          icon: Icon(
                            obscureText ? Icons.visibility_off : Icons.visibility,
                            color: Colors.black,
                          ),
                        ),
                        fillColor: AppColors.lightGrey,
                        filled: true,
                        border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          borderSide: BorderSide.none,
                        ),
                        hintText: '··········',
                        hintStyle: AppShrifts.poppinsMedium14.copyWith(
                          color: AppColors.darkGrey.withOpacity(0.6),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Пожалуйста, введите пароль';
                        }
                        return null;
                      },
                    ),
                  ),
                  // Кнопка регистрации
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: _register, // Вызов функции регистрации
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        minimumSize: const Size(300, 50),
                      ),
                      child: Text(
                        'Создать аккаунт',
                        style: AppShrifts.ralewaySemiBold14.copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                  // Отображение ошибки
                  if (errorMessage.isNotEmpty)
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        errorMessage,
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Есть аккаунт? ",
                    style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.darkGrey),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/');
                    },
                    child: Text(
                      "Войти",
                      style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0, right: 0, top: 140),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Нажимая создать аккаунт, вы соглашаетесь с нашей ",
                    style: AppShrifts.poppinsRegular12.copyWith(color: AppColors.darkGrey),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(),
              child: InkWell(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/politic');
                },
                child: Text(
                  "Политикой конфиденциальности",
                  style: AppShrifts.poppinsRegular12.copyWith(color: AppColors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
