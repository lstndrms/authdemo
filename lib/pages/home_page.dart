import 'package:flutter/material.dart';
import '../services/auth_service.dart';
class HomePage extends StatefulWidget {
    @override
    _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                title: Text("token is "),
            ),
            body:
            FlatButton(
                onPressed: () {
                    AuthService.removeToken();
                },
                child: Text("remove"),
            )
        );
    }
}