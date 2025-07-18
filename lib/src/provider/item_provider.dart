import 'package:riverpod/riverpod.dart';

import '../data/item_api.dart';
import '../models/item.dart';

final itemProvider = FutureProvider<List<Item>>((ref) async {
  final api = ref.watch(itemApiProvider);
  return await api.fetchItems();
});

final searchQueryProvider = StateProvider<String>((_) => '');
final filteredItemsProvider = FutureProvider<List<Item>>((ref) {
  final query = ref.watch(searchQueryProvider).toLowerCase();
  final items = ref.watch(itemsProvider).valueOrNull ?? [];
  return query.isEmpty
      ? items
      : items.where((e) => e.title.toLowerCase().contains(query)).toList();
});
