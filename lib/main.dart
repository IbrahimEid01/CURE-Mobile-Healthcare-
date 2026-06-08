import 'package:cure_app_3/core/app_router.dart';
import 'package:cure_app_3/screen/home_page.dart';
import 'package:cure_app_3/screen/services_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'screen/account_page.dart';
import 'screen/how_to_work_page.dart';
import 'screen/why_cuer_healthcare_page.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp.router(
//       debugShowCheckedModeBanner: false,
//       routerConfig: appRouter,
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//          useMaterial3: true,
//         scaffoldBackgroundColor: const Color(0xFFF8F9FC),
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: const Color(0xFF0B4A8B),
//           primary: const Color(0xFF0B4A8B),
//         ),

//       ),

//     );
//   }
// }
// void main() {
//   runApp(const CureApp());
// }

// class CureApp extends StatelessWidget {
//   const CureApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'CURE Healthcare',
//       theme: ThemeData(
//         useMaterial3: true,
//         colorScheme: ColorScheme.fromSeed(
//           seedColor: const Color(0xFF00408B),
//           brightness: Brightness.light,
//         ).copyWith(
//           primary: const Color(0xFF00408B),
//           secondary: const Color(0xFF006874),
//           surface: const Color(0xFFF9F9FF),
//         ),
//         scaffoldBackgroundColor: const Color(0xFFF9F9FF),
//         fontFamily: 'Roboto',
//       ),
//       builder: (context, child) {
//         return Directionality(
//           textDirection: TextDirection.rtl,
//           child: child ?? const SizedBox.shrink(),
//         );
//       },
//       home: const CureShell(),
//     );
//   }
// }

// class CureShell extends StatefulWidget {
//   const CureShell({super.key});

//   @override
//   State<CureShell> createState() => _CureShellState();
// }

// class _CureShellState extends State<CureShell> {
//   int index = 0;

//   final pages = const [
//     HomePage(),
//     ServicesPage(),
//     HowToWorkPage(),
//     WhyCureHealthcarePage(),
//     AccountPage(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     final labels = ['الرئيسية', 'الخدمات', 'الخطوات', 'لماذا كيور', 'حسابي'];
//     final icons = [
//       Icons.home_rounded,
//       Icons.medical_services_rounded,
//       Icons.alt_route_rounded,
//       Icons.verified_rounded,
//       Icons.person_outline_rounded,
//     ];

//     return Scaffold(
//       body: IndexedStack(index: index, children: pages),
//       bottomNavigationBar: Container(
//         decoration: const BoxDecoration(
//           color: Colors.white,
//           border: Border(top: BorderSide(color: Color(0xFFD8E3FA))),
//         ),
//         child: SafeArea(
//           top: false,
//           child: Padding(
//             padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
//             child: Row(
//               children: List.generate(labels.length, (i) {
//                 final selected = i == index;
//                 return Expanded(
//                   child: InkWell(
//                     borderRadius: BorderRadius.circular(18),
//                     onTap: () => setState(() => index = i),
//                     child: AnimatedContainer(
//                       duration: const Duration(milliseconds: 220),
//                       padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 6),
//                       decoration: BoxDecoration(
//                         color: selected ? const Color(0xFF7CEDFF).withOpacity(.55) : Colors.transparent,
//                         borderRadius: BorderRadius.circular(18),
//                       ),
//                       child: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Icon(
//                             icons[i],
//                             size: 24,
//                             color: selected ? const Color(0xFF006874) : const Color(0xFF424752),
//                           ),
//                           const SizedBox(height: 4),
//                           Text(
//                             labels[i],
//                             maxLines: 1,
//                             overflow: TextOverflow.ellipsis,
//                             style: TextStyle(
//                               fontSize: 12,
//                               fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
//                               color: selected ? const Color(0xFF006874) : const Color(0xFF424752),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 );
//               }),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

void main() {
  runApp(const CureApp());
}

class CureApp extends StatelessWidget {
  const CureApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CURE Healthcare',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme:
            ColorScheme.fromSeed(
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
      home: const CureShell(),
    );
  }
}

class CureShell extends StatefulWidget {
  const CureShell({super.key});

  @override
  State<CureShell> createState() => _CureShellState();
}

class _CureShellState extends State<CureShell> {
  int index = 0;

  final pages = const [
    HomePage(),
    ServicesPage(),
    HowToWorkPage(),
    WhyCureHealthcarePage(),
    AccountPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final labels = ['الرئيسية', 'الخدمات', 'الخطوات', 'لماذا كيور', 'حسابي'];
    final icons = [
      Icons.home_rounded,
      Icons.medical_services_rounded,
      Icons.alt_route_rounded,
      Icons.verified_rounded,
      Icons.person_outline_rounded,
    ];

    return Scaffold(
      body: IndexedStack(index: index, children: pages),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Color(0xFFD8E3FA))),
        ),
        child: SafeArea(
          top: false,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
            child: Row(
              children: List.generate(labels.length, (i) {
                final selected = i == index;
                return Expanded(
                  child: InkWell(
                    borderRadius: BorderRadius.circular(18),
                    onTap: () => setState(() => index = i),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 220),
                      padding: const EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 6,
                      ),
                      decoration: BoxDecoration(
                        color: selected
                            ? const Color(0xFF7CEDFF).withOpacity(.55)
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(18),
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            icons[i],
                            size: 24,
                            color: selected
                                ? const Color(0xFF006874)
                                : const Color(0xFF424752),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            labels[i],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: selected
                                  ? FontWeight.w700
                                  : FontWeight.w500,
                              color: selected
                                  ? const Color(0xFF006874)
                                  : const Color(0xFF424752),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
