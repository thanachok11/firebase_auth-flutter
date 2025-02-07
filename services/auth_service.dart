import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // สมัครสมาชิก
  Future<String?> signUp(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      return null; // สำเร็จ
    } catch (e) {
      return e.toString(); // ส่ง error กลับไป
    }
  }

  // ล็อกอิน
  Future<String?> signIn(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return null;
    } catch (e) {
      return e.toString();
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
}
