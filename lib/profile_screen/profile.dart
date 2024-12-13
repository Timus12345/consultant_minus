import 'package:consult_minus/themes/themes.dart';
import 'package:flutter/material.dart';
import 'package:consult_minus/navigation_menu/BottomNavBar.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: appBar(context),
      backgroundColor: AppColors.white,
      appBar: AppBar(
        title: Text('Добро пожаловать name'),
        backgroundColor: AppColors.white,
      ),
      body: Column(
        children:[
          Padding(padding: const EdgeInsets.only(left: 10, right: 0, top: 0),
            child: Text('meow',
                style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black)
            ),
          ),
        ]
      ),
    );
  }
}