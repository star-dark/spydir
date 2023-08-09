import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:spydir/users/models/user_profile_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserRepository {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Future<void> createProfile(UserProfileModel user) async {
    try {
      await _db.collection('user_profiles').doc(user.uid).set({
        'uid': user.uid,
        'email': user.email,
        'name': user.name,
        'bio': user.bio,
        'link': user.link,
      });
    } catch (e) {
      print('Error during profile creation: $e');
    }
  }
}

final userRepo = Provider(
  (ref) => UserRepository(),
);
