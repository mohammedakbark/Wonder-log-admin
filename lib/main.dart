import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wanderlog_admin/controller/auth_controller.dart';
import 'package:wanderlog_admin/controller/controller.dart';
import 'package:wanderlog_admin/view/home.dart';
import 'package:wanderlog_admin/view/login.dart';
import 'package:wanderlog_admin/view/navigation.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthController>(create: (_) => AuthController()),
        ChangeNotifierProvider<Controller>(create: (_) => Controller())
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: NavigationPage()),
    );
  }
}
