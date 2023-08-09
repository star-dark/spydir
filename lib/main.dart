import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_3/firebase_options.dart';
import 'package:flutter_application_3/user_authentication.dart';
import 'package:flutter_application_3/users/models/user_profile_model.dart';
import 'package:flutter_application_3/users/repos/user_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepo = UserRepository();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserAuthentication _auth = UserAuthentication();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('User Authentication Example')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  await _auth.signUpWithEmailAndPassword(
                      'test@example.com', 'password');

                  User? user = _auth.getCurrentUser();
                  if (user != null) {
                    UserProfileModel userProfile = UserProfileModel(
                      uid: user.uid,
                      email: user.email ?? '',
                      name: 'Test User',
                      bio: 'Hello, I am a test user!',
                      link: 'https://example.com',
                    );

                    await _createProfile(userProfile); // context를 제거
                  }
                },
                child: const Text('Sign Up and Create Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _createProfile(UserProfileModel userProfile) async {
    await userRepo.createProfile(userProfile);
  }
}
