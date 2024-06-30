import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

// Регистрация пользователя
Future<void> registerUser(
    String email, String password, String displayName) async {
  try {
    UserCredential userCredential =
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    // После успешной регистрации, добавьте имя пользователя в Firestore
    await FirebaseFirestore.instance
        .collection('users')
        .doc(userCredential.user?.uid)
        .set({
      'email': email,
      'displayName': displayName,
    });
  } catch (e) {
    print('Ошибка при регистрации: $e');
    rethrow; // Лучше передавать ошибку выше для обработки в UI
  }
}
