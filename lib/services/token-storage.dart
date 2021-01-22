import 'package:rxdart/rxdart.dart';

/// Storage for the jwt token, designed with the singleton pattern.
class TokenStorage {
  static final TokenStorage _instance = TokenStorage._internal();
  factory TokenStorage() => _instance;

  String _token;
  BehaviorSubject _tokenSubject = BehaviorSubject.seeded(null);

  TokenStorage._internal();

  String getToken() {
    return this._token;
  }

  /// Sets the new [token] and emits a new state.
  void setToken(String token) {
    _token = token;
    _tokenSubject.add(token);
  }

  /// A token stream which fires every time the token was changed.
  Stream get stream$ => _tokenSubject.stream;
}