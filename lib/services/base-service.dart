class BaseService {
  String rootUrl;

  BaseService({this.rootUrl});

  String getRootUrl() {
    return this.rootUrl;
  }

  void setRootUrl(String url) {
    this.rootUrl = url;
  }
}