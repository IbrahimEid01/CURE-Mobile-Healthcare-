import 'package:cure_app_3/core/app_router.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: ThemeData(
        primarySwatch: Colors.blue,
         useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF8F9FC),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF0B4A8B),
          primary: const Color(0xFF0B4A8B),
        ),

      ),
   
      
      
    );
  }
}
