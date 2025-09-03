import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:planets_app/presentation/filter_providers.dart';

class PlanetsUI extends ConsumerWidget {
  const PlanetsUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final planetAsync = ref.watch(filteredPlanetsProvider);
    return planetAsync.when(
      data: (planet) => Scaffold(
        appBar: AppBar(title: const Text("Planets")),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                onChanged: (value) {
                  ref.read(searchQueryProvider.notifier).state = value;
                },
                decoration: const InputDecoration(
                  labelText: "Buscar",
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                children: [
                  for (final w in planet)
                    GestureDetector(
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 5,
                        child: Column(
                          children: [
                            ClipRRect(
                              borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                              child: Image.network(
                                w.image,
                                loadingBuilder:
                                    (context, child, loadingProgress) =>
                                        (loadingProgress == null)
                                        ? child
                                        : CircularProgressIndicator(),
                                errorBuilder: (context, error, stackTrace) =>
                                    SizedBox(
                                      height: 100,
                                      child: Center(child: Icon(Icons.error)),
                                    ),
                                height: 120,
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Text(
                                w.name,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      onTap: () => context.push('/planets/${w.name}'),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Text(e.toString()),
    );
  }
}
