import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:planets_app/data/favorites_notifier.dart';
import 'package:planets_app/presentation/filter_providers.dart';

class PlanetsUI extends ConsumerWidget {
  const PlanetsUI({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final planets = ref.watch(filteredPlanetsProvider);
    final favorites = ref.watch(favoritesProvider);
    final notifier = ref.read(favoritesProvider.notifier);

    return planets.when(
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
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxis = constraints.maxWidth > 800 ? 4 : 2;
                  double aspectRatio = constraints.maxWidth > 800 ? 1.5 : 1;
                  double imageHeight = constraints.maxWidth > 800 ? 100 : 120;

                  return GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxis,
                      childAspectRatio: aspectRatio,
                    ),
                    itemCount: planet.length,
                    itemBuilder: (BuildContext context, int index) {
                      final isFav = favorites.contains(planet[index].name);

                      return GestureDetector(
                        child: Stack(
                          children: [
                            Card(
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
                                      planet[index].image,
                                      loadingBuilder:
                                          (
                                            context,
                                            child,
                                            loadingProgress,
                                          ) => (loadingProgress == null)
                                          ? child
                                          : Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            ),
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              SizedBox(
                                                height: 100,
                                                child: Center(
                                                  child: Icon(Icons.error),
                                                ),
                                              ),
                                      height: imageHeight,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(12.0),
                                    child: Text(
                                      planet[index].name,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Positioned(
                              top: 8,
                              right: 8,
                              child: IconButton(
                                icon: Icon(
                                  isFav ? Icons.star : Icons.star_border,
                                  color: isFav ? Colors.amber : Colors.grey,
                                ),
                                onPressed: () {
                                  notifier.toggleFavorite(planet[index].name);
                                },
                              ),
                            ),
                          ],
                        ),

                        onTap: () =>
                            context.push('/planets/${planet[index].name}'),
                      );
                    },
                  );
                },
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
