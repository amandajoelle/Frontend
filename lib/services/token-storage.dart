import 'package:rxdart/rxdart.dart';

class TokenStorage {
  static final TokenStorage _instance = TokenStorage._internal();
  factory TokenStorage() => _instance;

  String _token;
  BehaviorSubject _tokenSubject = BehaviorSubject.seeded(null);

  TokenStorage._internal();

  String getToken() {
    return this._token;
  }

  void setToken(String token) {
    _token = token;
    _tokenSubject.add(token);
  }

  Stream get stream$ => _tokenSubject.stream;
}