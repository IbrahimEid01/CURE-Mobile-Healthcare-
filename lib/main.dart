import 'package:cure_app_3/auth/cubit/auth_cubit.dart';
import 'package:cure_app_3/core/app_router.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (_) => AuthCubit()..checkCurrentUser(),
        ),
      ],
      child: const CureApp(),
    ),
  );
}

class CureApp extends StatelessWidget {
  const CureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'CURE Healthcare',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF00408B),
          brightness: Brightness.light,
        ).copyWith(
          primary: const Color(0xFF00408B),
          secondary: const Color(0xFF006874),
          surface: const Color.fromARGB(255, 11, 204, 165),
        ),
        scaffoldBackgroundColor: const Color(0xFFF9F9FF),
        fontFamily: 'Roboto',
      ),
      builder: (context, child) {
        return Directionality(
          textDirection: TextDirection.rtl,
          child: child ?? const SizedBox.shrink(),
        );
      },
      routerConfig: appRouter,
    );
  }
}