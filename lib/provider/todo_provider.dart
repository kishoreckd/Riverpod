import 'package:spi/models/todo.dart';
import 'package:flutter/material.dart';
import 'package:spi/service/todo_services.dart';

class TodoProvider extends ChangeNotifier {
  TodoService _service = TodoService();
  bool isLoading = false;
  List<dynamic> _todos = [];
  List<dynamic> get todos => _todos;

  Future<void> getAllTodos() async {
    isLoading = true;
    notifyListeners();
    final response = await _service.getAll();

    _todos = response;
    isLoading = false;
    notifyListeners();
  }
}
