import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:spi/models/api.dart';
import 'package:flutter/material.dart';
// import 'package:riverpod/models/api.dart';
// ignore_for_file: avoid_print

class APIProvider with ChangeNotifier {
  bool isLoading = true;

  String error = '';
  RickMorty datas = RickMorty(data: [] as Data);

  getDataFromAPI() async {
    var headers = {'Content-Type': 'application/json'};
    var data =
        '''{"query":"query {\\n  characters{\\n    results{\\n      id\\n      name\\n      image\\n      status\\n       location{\\n        id:id\\n        name\\n        type\\n        dimension\\n      }\\n    }\\n  }\\n\\n  \\n}\\n","variables":{}}''';

    var dio = Dio();
    var response = await dio.request(
      'https://rickandmortyapi.com/graphql',
      options: Options(
        method: 'POST',
        headers: headers,
      ),
      data: data,
    );

    if (response.statusCode == 200) {
      datas = RickMorty.fromJson(response.data);
      print(json.encode(response.data));
    } else {
      print(response.statusMessage);
    }
  }
}
