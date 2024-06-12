import 'dart:convert';
import 'package:http/http.dart';

class NetworkService {

  static final String baseUrl = "656ed2586529ec1c6236b4fe.mockapi.io";
  static final String baseUrlAdminAndUsers =
      "6570224909586eff6640c372.mockapi.io";

  static final String apiGameWord = "/userInfo";
  static final String apiAdmin = "/admin";
  static final String apiUsers = "/users";

  static final String botToken =
      '7063139571:AAGkcpsJNC4XKq1CMGi6jsuhsH1KHN73uLw';

  static final Map<String, String> _headers = {
    "Content-Type": "application/json"
  };

  /// Function to fetch data from a specified API endpoint using a base URL.
  /// Returns the response body if the request is successful,
  /// otherwise an error message with the status code.
  static Future<String> getData(String baseUrl, String api) async {
    Uri url = Uri.https(baseUrl, api);
    Response response = await get(url);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    } else {
      return "Something is wrong: ${response.statusCode}";
    }
  }

  /// Function to send POST request with provided body to a specified
  /// API endpoint using a base URL.
  /// Returns the status code as a string.dart if the request is successful,
  /// otherwise an error message with the status code.
  static Future<String> postData(String baseUrl, String api, Map<String, dynamic> body) async {
    Uri url = Uri.https(baseUrl, api);
    Response response =
        await post(url, body: jsonEncode(body), headers: _headers,);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.statusCode.toString();
    } else {
      return "Something is wrong: ${response.statusCode}";
    }
  }

  /// Function to send a DELETE request to delete data from a specified
  /// API endpoint using a base URL and an ID.
  /// Returns the status code of the response as a string.dart if successful,
  /// otherwise an error message with the status code.
  static Future<String> deleteData(String baseUrl, String api, String id) async {
    Uri url = Uri.https(baseUrl, "$api/$id");
    Response response = await delete(url, headers: _headers);

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.statusCode.toString();
    } else {
      return "Something is wrong: ${response.statusCode}";
    }
  }
}
