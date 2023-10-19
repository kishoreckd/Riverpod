import 'package:spi/models/user_model.dart';
import 'package:spi/service/user_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final UserDataProvider = FutureProvider<List<UserModel>>((ref) async {
  return ref.watch(UserProvider).getUsers();
});
