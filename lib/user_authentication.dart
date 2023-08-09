import 'package:firebase_auth/firebase_auth.dart';

class UserAuthentication {
  final FirebaseAuth _auth;

  UserAuthentication() : _auth = FirebaseAuth.instance;

  // 회원가입
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
    } catch (e) {
      print('Error during sign up: $e');
    }
  }

  // 로그인
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } catch (e) {
      print('Error during sign in: $e');
    }
  }

  // 로그아웃
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      print('Error during sign out: $e');
    }
  }

  // 현재 사용자 가져오기
  User? getCurrentUser() {
    return _auth.currentUser;
  }
}
