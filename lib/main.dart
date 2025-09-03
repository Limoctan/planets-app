import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:planets_app/presentation/home_ui.dart';
import 'package:planets_app/presentation/planet_details_ui.dart';
import 'package:planets_app/presentation/planets_ui.dart';

void main() {
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    if (kReleaseMode) exit(1);
  };
  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      theme: _buildTheme(Brightness.dark),
    );
  }
}

final GoRouter _router = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(path: '/home', builder: (context, state) => HomeUI()),
    GoRoute(path: '/planets', builder: (context, state) => PlanetsUI()),
    GoRoute(
      path: '/planets/:planet',
      builder: (context, state) =>
          PlanetDetailsUI(planet: state.pathParameters['planet']!),
    ),
  ],
);

ThemeData _buildTheme(Brightness brightness) {
  final ThemeData baseTheme = ThemeData(brightness: brightness);

  return baseTheme.copyWith(
    textTheme: GoogleFonts.notoSansTextTheme(
      baseTheme.textTheme.copyWith(
        headlineLarge: baseTheme.textTheme.headlineLarge?.copyWith(
          fontWeight: FontWeight.bold,
          color: Colors.white,
          letterSpacing: 3,
        ),
      ),
    ),
    scaffoldBackgroundColor: Colors.deepPurple[900],
  );
}
