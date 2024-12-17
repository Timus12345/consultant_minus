import 'package:consult_minus/favorites_screen/favorites.dart';
import 'package:consult_minus/menu/home.dart';
import 'package:consult_minus/politic/politic.dart';
import 'package:consult_minus/profile_screen/profile.dart';
import 'package:consult_minus/reg_screen/reg_screen.dart';
import 'package:flutter/material.dart';
import 'package:consult_minus/sign/sign.dart';
import 'package:consult_minus/services/supabase_service.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ServiceDatabase.initialize();

  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const sign_in(),
      '/reg': (context) => const reg_screen(),
      '/politic': (context) => const politic_screen(),
      '/home': (context) => home_screen(),
      '/profile': (context) => ProfileScreen(),
      '/favour': (context) => favorite_screen(),
    },
  ));
}