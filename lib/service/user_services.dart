import 'dart:convert';
import 'package:http/http.dart';
import 'package:spi/models/user_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class APIServices {
  String endpoint = 'https://reqres.in/api/users?page=2';

  Future<List<UserModel>> getUsers() async {
    Response response = await get(Uri.parse(endpoint));

    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      return result.map((e) => UserModel.fromJson(e)).toList();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

final UserProvider = Provider<APIServices>((ref) => APIServices());
