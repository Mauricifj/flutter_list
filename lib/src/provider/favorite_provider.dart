import 'package:flutter_list/src/provider/shared_preferences_provider.dart';
import 'package:riverpod/riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesNotifier extends StateNotifier<Set<String>> {
  FavoritesNotifier(this._prefs)
    : super(_prefs.getStringList('fav')?.toSet() ?? {});

  final SharedPreferences _prefs;

  void toggle(String id) {
    if (state.contains(id)) {
      state = {...state}..remove(id);
    } else {
      state = {...state, id};
    }
    _prefs.setStringList('fav', state.toList());
  }
}

final favoritesProvider = StateNotifierProvider<FavoritesNotifier, Set<String>>(
  (ref) {
    final prefs = ref.watch(sharedPrefsProvider);
    return FavoritesNotifier(prefs);
  },
);

final favCountProvider = Provider<int>(
  (ref) => ref.watch(favoritesProvider).length,
);
