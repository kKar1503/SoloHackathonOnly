import 'dart:convert';

import 'package:application_frontend/screens/settings.dart';
import 'package:application_frontend/utils/auth.dart';
import 'package:http/http.dart' as http;

class HttpService {
  linkTelegram() async {
    var url = Uri.parse("https://12d9-42-61-217-217.ngrok.io/telegram/link");
    var response = await http.post(url,
        body: jsonEncode({"documentId": Auth().getCurrentID()}));

    if (response.statusCode == 201) {
      // If the server did return a 201 CREATED response,
      // then parse the JSON.
      return Settings.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 201 CREATED response,
      // then throw an exception.
      throw Exception('Failed to create album.');
    }
  }
}
