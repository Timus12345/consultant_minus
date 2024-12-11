import 'package:consult_minus/politic/politic.dart';
import 'package:consult_minus/reg_screen/reg_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:consult_minus/sign/sign.dart';

void main() async
{
  runApp(MaterialApp(
    initialRoute: '/',
    routes:
    {
      '/': (context) => const sign_in(),
      '/reg': (context) => const reg_screen(),
      '/politic': (context) => const politic_screen()
    },
  ));
}
