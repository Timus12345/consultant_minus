import 'package:flutter/material.dart';
import 'package:consult_minus/themes/themes.dart';

class politic_screen extends StatefulWidget {
  const politic_screen({super.key});

  @override
  State<politic_screen> createState() => _politic_screenState();
}

class _politic_screenState extends State<politic_screen> {
  @override
  bool obscureText = true;
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Column(
        children: [
          Padding(padding: const EdgeInsets.only(right:290, top: 20 ),
              child: IconButton(onPressed: ()
              {
                Navigator.pushReplacementNamed(context, '/');
              },
                  icon: Image.asset('assets/strelka.png', width: 50, height: 50,))
          ),

        ],
      ),
    );
  }
}