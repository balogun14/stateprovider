// ignore_for_file: prefer_const_constructors, avoid_print


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stateprovider/models/settings_data.dart';
import 'package:stateprovider/models/user.dart';
import 'package:stateprovider/pages/settings.dart';
import 'package:stateprovider/routes/routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('Building MyApp');
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => User(),
          ),
          ChangeNotifierProvider(
            create: (context) => SettingsData(),
          )
        ],
        builder: (context, child) {
          return MaterialApp(
            initialRoute: RouteManager.loginPage,
            onGenerateRoute: RouteManager.generateRoute,
          );
        });
  }
}
