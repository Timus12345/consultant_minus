import 'package:flutter/material.dart';
import 'package:consult_minus/themes/themes.dart';
import 'package:consult_minus/services/supabase_service.dart'; // Import SupabaseService

class sign_in extends StatefulWidget {
  const sign_in({super.key});

  @override
  State<sign_in> createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
  bool obscureText = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  // Function to handle sign-in logic
  Future<void> _signIn() async {
    if (_formKey.currentState!.validate()) {
      try {
        // Call the signIn function from SupabaseService
        await SupabaseService.signIn(
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
        // Navigate to the home screen upon successful sign-in
        Navigator.pushReplacementNamed(context, '/home');
      } catch (e) {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Ошибка: $e')),
        );
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
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Text(
                'Войти в аккаунт',
                style: AppShrifts.ralewayBold32.copyWith(color: AppColors.black),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'Рады снова видеть вас!',
                textAlign: TextAlign.center,
                style: AppShrifts.poppinsRegular16.copyWith(color: AppColors.grey),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text(
                'Email',
                style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black),
              ),
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  // Email field
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
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
                  // Password field
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
                    child: Text(
                      'Пароль',
                      style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 15),
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
                  // Sign In button
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      onPressed: _signIn, // Call the sign-in function
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        minimumSize: const Size(300, 50),
                      ),
                      child: Text(
                        'Войти',
                        style: AppShrifts.ralewaySemiBold14.copyWith(color: AppColors.white),
                      ),
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
                    "Нет аккаунта? ",
                    style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.darkGrey),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacementNamed(context, '/reg');
                    },
                    child: Text(
                      "Зарегистрироваться",
                      style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}