import 'package:cure_app_3/core/app_shell.dart';
import 'package:cure_app_3/screen/account_page.dart';
import 'package:cure_app_3/screen/home_page.dart';
import 'package:cure_app_3/screen/how_to_work_page.dart';
import 'package:cure_app_3/screen/services_page.dart';
import 'package:cure_app_3/screen/why_cuer_healthcare_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/services',
              builder: (context, state) => const ServicesPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/how-to-work',
              builder: (context, state) => const HowToWorkPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/why-cure-healthcare',
              builder: (context, state) => const WhyCureHealthcarePage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/account',
              builder: (context, state) => const AccountPage(),
            ),
          ],
        ),
      ],
    ),
  ],
);