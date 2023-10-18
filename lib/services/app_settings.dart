class AppSettings {
  static final _singleton = AppSettings._internal();
  factory AppSettings() => _singleton;
  AppSettings._internal();

  static const serverDomain = 'my-json-server.typicode.com';
}
