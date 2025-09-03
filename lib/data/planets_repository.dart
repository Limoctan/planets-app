import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:planets_app/domain/planets_response.dart';
import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:planets_app/domain/planet.dart';

part 'planets_repository.g.dart';

class PlanetsRepository {
  const PlanetsRepository(this.client);

  final http.Client client;
  final _baseUrl =
      'https://us-central1-a-academia-espacial.cloudfunctions.net/planets';

  Future<List<Planet>> fetchPlanets() async {
    final response = await client.get(Uri.parse(_baseUrl));

    if (response.statusCode == 200) {
      return PlanetsResponse.fromJson(jsonDecode(response.body)).data;
    } else {
      throw Exception('Failed to load planets');
    }
  }
}

@riverpod
PlanetsRepository planetsRepository(Ref ref) {
  return PlanetsRepository(http.Client());
}

@riverpod
Future<List<Planet>> fetchPlanets(Ref ref) {
  return ref.watch(planetsRepositoryProvider).fetchPlanets();
}
