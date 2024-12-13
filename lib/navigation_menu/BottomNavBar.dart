import 'package:consult_minus/themes/themes.dart';
import 'package:flutter/material.dart';

Widget appBar(context) {
  return Stack(
    children: [
      Container(
        height: 50,
        width: double.infinity,// Adjust height as needed
        color: AppColors.white, // Background color
      ),
      Positioned(
        left: 60,
        child: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/home');
          },
          icon: Image.asset('home.png'),
        ),
      ),
      Positioned(
        left: 160,
        child: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/favour');
          },
          icon: Image.asset('heart.png'),
        ),
      ),
      Positioned(
        right: 60,
        child: IconButton(
          onPressed: () {
            Navigator.pushReplacementNamed(context, '/profile');
          },
          icon: Image.asset('profile.png'),
        ),
      ),
    ],
  );
}