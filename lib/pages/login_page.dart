import 'package:flutter/material.dart';
import '../form_bloc/form_bloc.dart';


class LoginPage extends StatefulWidget {
    @override
    _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
    final formBloc = new FormBloc();
    @override
    Widget build(BuildContext context) {
        return Scaffold(
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
                                child: _emailField(formBloc),
                            ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
                            child: Container(
                                constraints: BoxConstraints(maxWidth: 400),
                                child: _passwordField(formBloc)
                            ),
                        ),
                        FlatButton(
                            onPressed: () {
                                //smth
                            },
                            child: Text(
                                "Forgot password?",
                                style: TextStyle(color: Colors.blue, fontSize: 15),
                            ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(left: 15, right: 15, bottom: 20),
                            
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                ),
                                constraints: BoxConstraints(maxWidth: 400),
                                child: _buttonField(formBloc)
                            ),
                        ),
                        Container(
                            
                            padding: EdgeInsets.only(top: 90),
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

    Widget _emailField(FormBloc bloc) {
        return StreamBuilder<String>(
            stream: bloc.email,
            builder: (context, snapshot) {
                return TextField(
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Email',
                        hintText: 'Enter valid email',
                    ),
                    onChanged: bloc.changeEmail,
                );
            }
        );
    }

    Widget _passwordField(FormBloc bloc) {
        return StreamBuilder<String>(
            stream: bloc.email,
            builder: (context, snapshot) {
                return TextField(
                    obscureText: true,
                    maxLength: 20,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Password',
                        hintText: '',
                    ),
                    onChanged: bloc.changePassword,
                );
            }
        );
    }

    Widget _buttonField(FormBloc bloc) {
        return StreamBuilder<bool>(
            stream: bloc.submitForm,
            builder: (context, snapshot) {
                return RaisedButton(
                    onPressed: () {
                        bloc.login(context);
                    },
                    child: Text(
                        "Login",
                        style: TextStyle(color: Colors.white, fontSize: 20)
                        ),
                );
            }
        );
    }
}


