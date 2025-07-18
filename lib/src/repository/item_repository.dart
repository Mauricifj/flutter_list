import 'package:riverpod/riverpod.dart';

import '../data/item_api.dart';
import '../models/item.dart';

class ItemRepository {
  final ItemApi itemApi;

  ItemRepository({required this.itemApi});

  Future<List<Item>> getItems() async {
    return await itemApi.fetchItems();
  }
}

final itemRepositoryProvider = Provider<ItemRepository>((ref) {
  final itemApi = ref.watch(itemApiProvider);
  return ItemRepository(itemApi: itemApi);
});
