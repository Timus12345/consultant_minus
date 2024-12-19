import 'package:consult_minus/themes/themes.dart';
import 'package:consult_minus/navigation_menu/BottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:consult_minus/services/supabase_service.dart'; // Import SupabaseService

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late String _username = '';
  late String _email = '';
  final TextEditingController _aboutController = TextEditingController();

  Future<void> _loadUserData() async { // Объявляем функцию для загрузки данных
    try {
      Map<String, dynamic> user = await ServiceDatabase.getUser(); // Ожидание результата

      setState(() {
        _username = user['name'];
        _email = user['email'];
      });

    } catch (e) {
      print("Ошибка получения пользователя: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserData();
    _aboutController.text = "Я студент - ем паштет!";
  }

  void _saveProfile() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: AppColors.white,
        title: const Text("Данные сохранены"),
        content: const Text("Ваш профиль обновлен!"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('OK', style: AppShrifts.ralewayMedium16.copyWith(color: AppColors.black),),
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
      bottomNavigationBar: appBar(context),
      appBar: AppBar(
        title: const Text('Ваш профиль'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: AppColors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildInfoField("ФИО", _username),
              const SizedBox(height: 16),
              _buildInfoField("Почта", _email),
              const SizedBox(height: 16),
              _buildEditableField("О себе", _aboutController),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: _saveProfile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text(
                  "Сохранить изменения",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: _logout,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
                child: const Text(
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
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(12.0),
          decoration: BoxDecoration(
            color: Colors.grey[200],
            borderRadius: BorderRadius.circular(4.0),
            border: Border.all(color: Colors.grey),
          ),
          child: Text(
            value,
            style: const TextStyle(fontSize: 16),
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
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: 3,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: "Введите Информацию $label",
          ),
        ),
      ],
    );
  }
}