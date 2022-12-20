// ignore_for_file: avoid_print, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateprovider/models/user.dart';

import '../routes/routes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController usernameController = TextEditingController();

  @override
  void dispose() {
    usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('Building Login');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                keyboardType: TextInputType.text,
                controller: usernameController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                        20,
                      ),
                    ),
                    labelText: 'Please enter your username'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                context.read<User>().username = usernameController.text;
                Navigator.of(context).pushNamed(RouteManager.mainPage);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
