import 'dart:async';

import 'package:http/http.dart' as http;
import 'package:lockers/services/api/api_controller_service.dart';
import 'package:lockers/services/app_settings.dart';

class ApiService {
  static const subController = '/ozon671game/demo/';
  static const timeout = 20;

  Map<String, dynamic> subBody = {};

  Map<String, String> headersRequest = {'Content-Type': 'application/x-www-form-urlencoded'};

  Future<http.Response?> get({required ApiControllerService controller, Map<String, String>? body}) async {
    final data = '$subController${controller.url()}';
    final queryParameters = subBody;
    final url = Uri.https(AppSettings.serverDomain, data, queryParameters);
    final response = await http.get(url, headers: headersRequest).timeout(const Duration(seconds: timeout));
    // https: //my-json-server.typicode.com/ozon671game/demo/db
    return response;
  }
}
