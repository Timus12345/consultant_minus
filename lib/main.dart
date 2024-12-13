import 'package:consult_minus/favorites_screen/favorites.dart';
import 'package:consult_minus/menu/home.dart';
import 'package:consult_minus/politic/politic.dart';
import 'package:consult_minus/profile_screen/profile.dart';
import 'package:consult_minus/recovery/recovery.dart';
import 'package:consult_minus/reg_screen/reg_screen.dart';
import 'package:consult_minus/verify/verify.dart';
import 'package:flutter/material.dart';
import 'package:consult_minus/sign/sign.dart';

void main() async {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const sign_in(),
      '/reg': (context) => const reg_screen(),
      '/politic': (context) => const politic_screen(),
      '/recovery': (context) => const recovery(),
      '/verify': (context) => const verification_screen(),
      '/home': (context) => home_screen(),
      '/profile': (context) => ProfileScreen(),
      '/favour': (context) => favorite_screen(),
    },
  ));
}