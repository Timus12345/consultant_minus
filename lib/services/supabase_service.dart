import 'package:flutter/cupertino.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ServiceDatabase {
  static const _supabaseUrl = 'https://wjfdjrlupjhffiercthu.supabase.co';
  static const _supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndqZmRqcmx1cGpoZmZpZXJjdGh1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ0MTIxNzksImV4cCI6MjA0OTk4ODE3OX0.mBoor-oZ7RgY3oKDU15s_EE248Ft0QASSh4SdeGe0Fg';
  static late SupabaseClient supabase;

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: _supabaseUrl,
      anonKey: _supabaseKey,
    );

    supabase = SupabaseClient(
        _supabaseUrl,
        _supabaseKey,
      authOptions: const AuthClientOptions(authFlowType: AuthFlowType.implicit),
    );
  }

  static Future<void> signUp(
      String email,
      String name,
      String password
      ) async {
    final response = await supabase.auth.signUp(
      email: email,
      password: password,
      data: {
        'name': name
      }
    );
    print(response.user);

    if (response.user == null) {
      throw Exception("Регистрация не удалась");
    }

  }

  static Future<void> signIn(String email, String password) async {
    final response = await supabase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    if (response.user == null) {
      throw Exception("Ошибка авторизации");
    }
  }

  static Future<void> signOut() async {
    await supabase.auth.signOut();
  }

  static Future<Map<String, dynamic>> getUser() async {
    var section = supabase.auth.currentSession;
    var user = supabase.auth.getUser();
    print(user);
    return {
      'name': 'user?.email', // Использовать строковые ключи
      'email': 'user?.email', // Сделать email строкой для согласованности
    };
  }
}
