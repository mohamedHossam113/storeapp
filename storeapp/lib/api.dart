import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class Api {
  Future<dynamic> get({required String url, Map<String, dynamic>? body}) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded',
    };
    http.Response response = await http.get(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> post({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    http.Response response =
        await http.post(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('problem with status code ${response.statusCode}');
    }
  }

  Future<dynamic> put({
    required String url,
    required Map<String, dynamic> body,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    if (kDebugMode) {
      print('url: $url, body: $body');
    }
    http.Response response =
        await http.put(Uri.parse(url), body: body, headers: headers);
    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      if (kDebugMode) {
        print('data: $data');
      }
      return data;
    } else {
      throw Exception(
          'problem with status code ${response.statusCode}, url: $url, body: $body, response: ${response.body}');
    }
  }

  Future<dynamic> delete({
    required String url,
  }) async {
    Map<String, String> headers = {
      'Content-Type': 'application/x-www-form-urlencoded'
    };
    http.Response response =
        await http.delete(Uri.parse(url), headers: headers);
    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      throw Exception('problem with status code ${response.statusCode}');
    }
  }
}
