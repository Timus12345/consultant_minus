import 'package:consult_minus/themes/themes.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final String _username = "user123";
  final String _email = "user@example.com";
  final TextEditingController _aboutController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _aboutController.text = "Я студент - ем паштет!";
  }

  void _saveProfile() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Данные сохранены"),
        content: Text("Ваш профиль обновлен!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  void _logout() {
    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 0, right: 0),
                    child: IconButton(onPressed: ()
                    {
                      Navigator.pushReplacementNamed(context, '/home');
                    },
                        icon: Image.asset('assets/strelka.png', width: 50, height: 50,)),
                  ),
                  Text('Профиль', style: AppShrifts.poppinsSemiBold24.copyWith(color: AppColors.black),)
                ],
              ),
              _buildInfoField("Логин", _username),
              SizedBox(height: 16),
              _buildInfoField("Почта", _email),
              SizedBox(height: 16),
              _buildEditableField("О себе", _aboutController),
              SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: Text(
                  "Сохранить изменения",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _logout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: Text(
                  "Выйти из аккаунта",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoField(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: Colors.grey),
          ),
          child: Text(
            value,
            style: TextStyle(fontSize: 16),
          ),
        ),
      ],
    );
  }

  Widget _buildEditableField(String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: 3,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Введите Информацию $label",
          ),
        ),
      ],
    );
  }
}