class TokenStorage {
  static final TokenStorage _instance = TokenStorage._internal();
  factory TokenStorage() => _instance;

  String _token;

  TokenStorage._internal();

  String getToken() {
    return this._token;
  }

  void setToken(String token) {
    this._token = token;
  }
}