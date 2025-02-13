import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ForgotPasswordScreenState createState() => ForgotPasswordScreenState();
}

class ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController emailController = TextEditingController();
  final AuthService _authService = AuthService();
  String message = '';

  void resetPassword() async {
    String email = emailController.text.trim();
    if (email.isEmpty) {
      setState(() => message = 'กรุณากรอกอีเมลของคุณ');
      return;
    }

    String? error = await _authService.resetPassword(email);
    
    if (!mounted) return;

    if (error == null) {
      setState(() => message = 'อีเมลเปลี่ยนรหัสผ่านถูกส่งแล้ว! กรุณาตรวจสอบอีเมลของคุณ');
    } else {
      setState(() => message = error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ลืมรหัสผ่าน', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        backgroundColor: Colors.brown,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
                prefixIcon: const Icon(Icons.email, color: Colors.brown),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: resetPassword,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text('ส่งอีเมลเปลี่ยนรหัสผ่าน', style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
            if (message.isNotEmpty) ...[
              const SizedBox(height: 10),
              Text(message, style: const TextStyle(color: Colors.red, fontSize: 16)),
            ],
          ],
        ),
      ),
    );
  }
}
