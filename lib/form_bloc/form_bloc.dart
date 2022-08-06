import 'package:flutter/material.dart';
import '../services/auth_service.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:convert';

class FormBloc {
    final _email = new BehaviorSubject<String>();
    final _password = new BehaviorSubject<String>();
    final _errorMessage = new BehaviorSubject<String>();

    Function(String) get changeEmail {
        addError("");
        return _email.sink.add;
    }

    Function(String) get changePassword {
        addError("");
        return _password.sink.add;
    }

    Function(String) get addError => _errorMessage.sink.add;

    Stream<String> get email => _email.stream;
    Stream<String> get password => _password.stream;
    Stream<String> get errorMessage => _errorMessage.stream;

    Stream<bool> get submitForm => Rx.combineLatest3(
        email,
        password,
        errorMessage,
        (e, p, er) => true,
    );

    var authService;

    dynamic login(BuildContext context) async {
    //dynamic login() async {
        authService = AuthService();
        final response = await authService.login(_email.value, _password.value);
        //final response = await authService.login('asd', '123123123');
        var data =  jsonDecode(response) as Map<String, dynamic>;
        print(data['token']);
        AuthService.setToken(data['token']);
        Navigator.pushReplacementNamed(context, '/home');
        return data;
    }


    dispose() {
        _email.close();
        _password.close();
        _errorMessage.close();
    }
}