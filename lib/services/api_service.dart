import 'package:dio/dio.dart';
import 'package:todolist_app/models/task.dart';

// API_SERVICE class handles API requests related to tasks using Dio (CRUD).
class ApiService {
  final _dio = Dio();

  // Base URL for the API
  final String baseUrl = 'https://jsonplaceholder.typicode.com';

  // Fetches a list of tasks from the API.
  Future<List<Task>> getTasks() async {
    final response = await _dio.get('$baseUrl/todos');
    return (response.data as List).map((task) => Task.fromJson(task)).toList();
  }

  // Creates a new task on the server.
  Future<Task> createTask(Task task) async {
    final response = await _dio.post('$baseUrl/todos', data: task.toJson());
    return Task.fromJson(response.data);
  }

  // Updates an existing task on the server.
  Future<Task> updateTask(int id, Task task) async {
    final response = await _dio.put('$baseUrl/todos/$id', data: task.toJson());
    return Task.fromJson(response.data);
  }

  // Deletes a task with the given [id] from the server.
  Future<void> deleteTask(int id) async {
    await _dio.delete('$baseUrl/todos/$id');
  }
}
