import 'package:flutter/material.dart';
import 'package:flutter_meedu/flutter_meedu.dart';
import 'package:islas/controllers/theme/theme_provider.dart';
import 'pages/home.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer(builder: (_, ref, __) {
      final controller = ref.watch(themeProvider);
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: controller.darkTheme ? ThemeMode.dark : ThemeMode.light,
        darkTheme: ThemeData.dark().copyWith(
            primaryColor: Colors.green.shade400,
            hintColor: Colors.blue.shade400),
        theme: ThemeData.light().copyWith(
            primaryColor: Colors.blue.shade400,
            hintColor: Colors.green.shade400),
        home: const MyHomePage(title: 'Islands tres astronautas'),
      );
    });
  }
}
