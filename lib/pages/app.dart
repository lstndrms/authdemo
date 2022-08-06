import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../services/auth_service.dart';
import 'login_page.dart';
import 'home_page.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Auth',
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
            future: AuthService.getToken(),
            builder: (_, snapshot) {
                print(snapshot.data);
                if (snapshot.connectionState == ConnectionState.waiting) {
                    return CircularProgressIndicator();
                } else if (snapshot.hasData) {
                    return HomePage();
                } else {
                    return LoginPage();
                }
            },
        ),
        routes: {
            '/home' : (_) => HomePage(),
            '/login': (_) => new LoginPage(),
        },
    );
  }
}

