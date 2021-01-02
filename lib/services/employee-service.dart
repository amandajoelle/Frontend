import 'dart:convert';
import 'package:cirs/services/base-service.dart';
import 'package:cirs/services/token-storage.dart';
import 'package:http/http.dart';

class EmployeeService extends BaseService {
  final String loginPath = "/login/";

  EmployeeService(String url): super(rootUrl: url);

  Future<bool> login(String email, String password) async {
    try {
      Response response = await post(
          getRootUrl() + loginPath,
          headers: {'Accept': 'application/json', 'Content-Type': 'application/json'},
          body: jsonEncode(<String, String>{'email': email, 'password': password}));
      Map data = jsonDecode(response.body);
      TokenStorage tokenStorage = TokenStorage();
      tokenStorage.setToken(data['token']);
    } catch(error) {
      print('Caught error: $error');
      return false;
    }
    return true;
  }
}

class Employee {
  String employeeId;
  String email;
  String password;
  String forename;
  String lastname;

  Employee({this.employeeId, this.email, this.password, this.forename, this.lastname});

  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(
      employeeId: json['employee_id'],
      email: json['email'],
      password: json['password'],
      forename: json['forename'],
      lastname: json['lastname']
    );
  }

  @override
  String toString() {
    return 'Id: $employeeId, email: $email, forename: $forename, lastname: $lastname';
  }
}