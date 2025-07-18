import 'package:riverpod/riverpod.dart';

import '../models/item.dart';
import '../models/tag.dart';

class ItemApi {
  Future<List<Item>> fetchItems() async {
    await Future.delayed(Duration(seconds: 2));
    return [
      Item(id: '1', title: 'Item 1', createdAt: DateTime.parse('2023-01-01'), tag: Tag.newTag),
      Item(id: '2', title: 'Item 2', createdAt: DateTime.parse('2023-01-02'), tag: Tag.oldTag),
      Item(id: '3', title: 'Item 3', createdAt: DateTime.parse('2023-01-03'), tag: Tag.hotTag),
    ];
  }
}

final itemApiProvider = Provider<ItemApi>((ref) => ItemApi());

final itemsProvider = FutureProvider<List<Item>>((ref) {
  final api = ref.watch(itemApiProvider);
  return api.fetchItems();
});
