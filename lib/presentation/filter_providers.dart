import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:planets_app/data/planets_repository.dart';
import 'package:planets_app/domain/planet.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filter_providers.g.dart';

final searchQueryProvider = StateProvider<String>((ref) => "");

@riverpod
AsyncValue<List<Planet>> filteredPlanets(Ref ref) {
  final query = ref.watch(searchQueryProvider);
  final items = ref.watch(fetchPlanetsProvider);
  if (query.isEmpty) return items;

  return items.whenData((items) {
    return items.where((item) => item.contains(query.toLowerCase())).toList();
  });
}
