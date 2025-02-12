import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // สมัครสมาชิก
  Future<String?> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return null; // สำเร็จ
    } on FirebaseAuthException catch (e) {
      if (e.code == 'email-already-in-use') {
        return 'อีเมลนี้ถูกใช้ไปแล้ว';
      }
      return e.message;
    }
  }

  // ล็อกอิน
  Future<String?> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null; // สำเร็จ
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  // ออกจากระบบ
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // ตรวจสอบว่ามีผู้ใช้ล็อกอินอยู่หรือไม่
  User? getCurrentUser() {
    return _auth.currentUser;
  }

  String getCurrentUserEmail() {
    User? user = _auth.currentUser;
    return user?.email ??
        'ผู้ใช้ไม่ระบุ'; // หากไม่มีผู้ใช้ล็อกอิน, ให้คืนค่าผู้ใช้ไม่ระบุ
  }
}
