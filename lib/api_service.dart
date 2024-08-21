import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:mvvm_assignment/User_model.dart';

class ApiService {
  final String apiUrl = "https://jsonplaceholder.typicode.com/users";

  Future<List<User>> fetchUsers() async {
    try {
      final response = await http.get(Uri.parse(apiUrl));

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        return data.map((json) => User.fromJson(json)).toList();
      } else {
        throw Exception("Failed to load users");
      }
    } catch (e) {
      throw Exception("Failed to connect to the server. Please check your internet connection.");
    }
  }
}
