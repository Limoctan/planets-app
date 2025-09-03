import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeUI extends StatelessWidget {
  const HomeUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("PLANETS", style: Theme.of(context).textTheme.headlineLarge),
            SizedBox(height: 15),
            Text(
              "Discover the planets \n in our solar system!",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => context.go('/planets'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple[400],
                padding: const EdgeInsets.symmetric(
                  horizontal: 32,
                  vertical: 12,
                ),
              ),
              child: const Text(
                "Go to Planets",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
