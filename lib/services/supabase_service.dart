import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static final _supabaseUrl = 'https://wjfdjrlupjhffiercthu.supabase.co';
  static final _supabaseKey = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6IndqZmRqcmx1cGpoZmZpZXJjdGh1Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MzQ0MTIxNzksImV4cCI6MjA0OTk4ODE3OX0.mBoor-oZ7RgY3oKDU15s_EE248Ft0QASSh4SdeGe0Fg';
  static late SupabaseClient supabase;

  static Future<void> initialize() async {
    await Supabase.initialize(
      url: _supabaseUrl,
      anonKey: _supabaseKey,
    );
    supabase = SupabaseClient(_supabaseUrl, _supabaseKey);
  }

  static Future<void> signUp(String email, String password) async {
    final response = await supabase.auth.signUp(
      email: email,
      password: password,
    );
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
}
