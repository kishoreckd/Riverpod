import 'dart:convert';
import 'package:spi/models/todo.dart';
import 'package:http/http.dart' as http;
// ignore_for_file: non_constant_identifier_names

class TodoService {
  Future<List> getAll() async {
    const url = 'https://jsonplaceholder.typicode.com/todos';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      final todos = json.map((e) {
        return Todo(
          id: e['id'],
          userId: e['userId'],
          title: e['title'],
          completed: e['completed'],
        );
      }).toList();
      return todos;
    }
    return [];
    // throw "something went wrong";
  }
}
