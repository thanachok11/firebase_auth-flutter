import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  final AuthService _authService = AuthService();

  HomeScreen({super.key});

  void logout(BuildContext context) async {
    await _authService.signOut();

    // ✅ ตรวจสอบ context.mounted ก่อนใช้ Navigator
    if (!context.mounted) return;

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const LoginScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'หน้าหลัก',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.brown, // ✅ เปลี่ยนสีให้ดูอบอุ่น
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () => logout(context),
          )
        ],
      ),
      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20.0), // ✅ เพิ่ม Padding
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.coffee, // ✅ ใช้ไอคอนแทนความเป็นกันเอง
                size: 80,
                color: Colors.brown,
              ),
              SizedBox(height: 20),
              Text(
                'ยินดีต้อนรับ!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'ขอให้เป็นวันที่ดี ☕',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
