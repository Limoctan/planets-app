import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'favorites_notifier.g.dart';

@riverpod
class Favorites extends _$Favorites {
  static const _key = "favorites";

  @override
  List<String> build() {
    _load();
    return [];
  }

  Future<void> _load() async {
    final prefs = await SharedPreferences.getInstance();
    state = prefs.getStringList(_key) ?? [];
  }

  Future<void> toggleFavorite(String planetName) async {
    if (state.contains(planetName)) {
      state = state.where((name) => name != planetName).toList();
    } else {
      state = [...state, planetName];
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_key, state);
  }

  bool isFavorite(String planetName) => state.contains(planetName);
}
