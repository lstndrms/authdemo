import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class AuthService {
    final _url = 'http://localhost:3000';

    static final SESSION = FlutterSession();
    
    static Future<dynamic> getToken() async {
        return await SESSION.get('token');
    }

    Future<dynamic> login(String email, String password) async {
        try {
            var currentToken = await SESSION.get('token');
            var response = await http.post(
                    Uri.parse("http://localhost:3000/login"),
                    headers: <String, String> {
                        "Content-Type": "application/json",
                    },
                    body:  jsonEncode(<String, String>{
                        'email': email,
                        'password': password
                        }
                    ),
                ).catchError(
                    (e) {
                        print("error");
                    }
                );
            return response.body;
        } finally {

        }
    }

    static setToken(String token) async {
        await SESSION.set('token', token);
    }
    
    static removeToken() async {
        await SESSION.prefs.clear();
    }
}
