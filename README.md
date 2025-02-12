# 📱 Flutter Authentication App

## 🔥 คุณสมบัติของแอป
- สมัครสมาชิกพร้อมยืนยันรหัสผ่าน
- ล็อกอินเข้าใช้งาน
- ตรวจสอบข้อผิดพลาดและแสดงข้อความแจ้งเตือน
- หน่วงเวลา 2 วินาทีก่อนเปลี่ยนหน้าเมื่อเข้าสู่ระบบหรือสมัครสมาชิกสำเร็จ

## 🛠 เทคโนโลยีที่ใช้
- Flutter
- Dart
- Firebase Authentication (หรือระบบล็อกอินอื่นที่คุณใช้)

## 📂 โครงสร้างโปรเจกต์
📂 lib
┣ 📂 services
┃ ┗ 📜 auth_service.dart # จัดการการสมัครสมาชิกและล็อกอิน
┣ 📂 screens
┃ ┣ 📜 login_screen.dart # หน้าล็อกอิน
┃ ┣ 📜 register_screen.dart # หน้าสมัครสมาชิก
┃ ┗ 📜 home_screen.dart # หน้าหลักหลังจากล็อกอินสำเร็จ
┗ 📜 main.dart # จุดเริ่มต้นของแอป

## 🚀 การติดตั้งและรันโปรเจกต์
1. ติดตั้ง Flutter และ Dart  
2. โคลนโปรเจกต์นี้  
```git clone https:https://github.com/thanachok11/firebase_auth-flutter.git```
```cd firebase_auth-flutter ```
ติดตั้ง dependencies

```flutter pub get```
รันแอป
```flutter run ```
## 📝 วิธีใช้งาน
- # เปิดแอปและสมัครสมาชิก
- # กรอกอีเมลและรหัสผ่าน จากนั้นกดยืนยันรหัสผ่าน
- # เมื่อสมัครสำเร็จ ระบบจะพากลับไปยังหน้าล็อกอินอัตโนมัติใน 2 วินาที
- # เข้าสู่ระบบด้วยอีเมลและรหัสผ่านที่สมัครไว้
- # หากล็อกอินสำเร็จ ระบบจะรอ 2 วินาทีแล้วพาไปยังหน้า Home
- # หากล็อกอินผิดพลาด ระบบจะแสดง Alert แจ้งเตือน