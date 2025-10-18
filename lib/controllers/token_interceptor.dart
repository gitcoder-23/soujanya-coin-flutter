import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class HttpAuthClient {
  static Future<Map<String, String>> getHeaders() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('userToken');

    log('HttpAuthClient=inter=> ${token}');
    return {
      if (token != null && token.isNotEmpty) 'Authorization': 'Bearer $token',
    };
  }

  static Future<http.Response> post(
    String url, {
    required Map<String, dynamic> body,
  }) async {
    final headers = await getHeaders();
    headers[HttpHeaders.contentTypeHeader] = "application/json";
    return await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(body),
    );
  }

  static Future<http.Response> get(String url) async {
    final headers = await getHeaders();
    return await http.get(Uri.parse(url), headers: headers);
  }

  // Multipart POST request
  static Future<http.Response> postMultipart(
    String url, {
    Map<String, String>? body,
    required List<String>
    filePaths, // change signature: a simple list of file paths
    String fileFieldName = 'attachments', // default field name
  }) async {
    // Get auth headers, but DO NOT set Content-Type manually
    final authHeaders = await getHeaders();

    final request = http.MultipartRequest('POST', Uri.parse(url));
    request.headers.addAll(authHeaders); // no Content-Type here

    // Add fields
    if (body != null) {
      request.fields.addAll(body);
    }

    // Add files (await properly)
    for (final path in filePaths) {
      // You can supply a filename if needed:
      final file = await http.MultipartFile.fromPath(fileFieldName, path);
      request.files.add(file);
    }

    // Optional: better debugging (before sending)
    log('Request URL: $url');
    log('Request headers (final): ${request.headers}');
    log('Request fields: ${request.fields}');
    log('Request files count: ${request.files.length}');

    // Send
    final streamed = await request.send();

    // Read once, return usable Response
    final resp = await http.Response.fromStream(streamed);
    log('Response Status Code: ${resp.statusCode}');
    log('Response Body: ${resp.body}');
    return resp;
  }
}
