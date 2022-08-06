import 'package:flutter/material.dart';
import '../services/auth_service.dart';
class LoginPage extends StatefulWidget {
    @override
    _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    @override
    Widget build(BuildContext context) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
                title: Text("LoginPage"),
            ),
            body: SingleChildScrollView(
                child: Column(
                    children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.only(top: 30, bottom: 30),
                            child: Center(
                                child: Container(
                                    //color: Colors.red,
                                    width: 200,
                                    height: 150,
                                    child: Image.asset('asset/images/RPC-JP_Logo.png'),
                                ),
                            ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
                            child: Container(
                                constraints: BoxConstraints(maxWidth: 400),
                                child: TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Email',
                                        hintText: 'Enter valid email',
                                    ),
                                ),
                            ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
                            child: Container(
                                constraints: BoxConstraints(maxWidth: 400),
                                child: TextField(
                                    decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        labelText: 'Password',
                                        hintText: 'Enter your password',
                                    ),
                                ),
                            ),
                        ),
                        FlatButton(
                            padding: EdgeInsets.only(bottom: 50),
                            onPressed: () {
                                //smth
                            },
                            child: Text(
                                "Forgot password?",
                                style: TextStyle(color: Colors.blue, fontSize: 15),
                            ),
                        ),
                        Container(
                            
                            color: Colors.blue,
                            width: 250,
                            height: 50,
                            constraints: BoxConstraints(maxWidth: 250),
                            child: FlatButton(
                                onPressed: () {
                                    AuthService.setToken('123');
                                },
                                child: Text(
                                    "Login",
                                    style: TextStyle(color: Colors.white, fontSize: 20),
                                ),
                            ),
                        ),
                        Container(
                            
                            padding: EdgeInsets.only(top: 20),
                            constraints: BoxConstraints(maxWidth: 400),
                            child: FlatButton(
                                onPressed: () {
                                    //todo
                                },
                                child: Text(
                                    "New user? Create Account",
                                    style: TextStyle(color: Colors.blue, fontSize: 18),
                                ),
                            ),
                        ),
                    ],
                ),
            ),
        );
    }
}