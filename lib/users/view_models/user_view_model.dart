import 'dart:async';

import 'package:flutter_application_3/users/models/user_profile_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserViewModel extends AsyncNotifier<UserProfileModel> {
  @override
  FutureOr<UserProfileModel> build() {
    return UserProfileModel.empty();
  }

  //Future<void> createAccount()
}

final usersProvider = AsyncNotifierProvider(
  () => UserViewModel(),
);
