import 'package:flutter/material.dart';
import 'package:flutter_with_api/camera.dart';
import 'package:flutter_with_api/home.dart';
import 'package:flutter_with_api/login_page.dart';
import 'package:flutter_with_api/sign_up_page.dart';
import 'package:flutter_with_api/weather.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const HomePage(),
        '/signup': (context) => const SignUpPage(),
        '/camera': (context) => const CameraPage(),
        '/weather': (context) => const WeatherPage(),
      },
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: "/weather",
    );
  }
}
