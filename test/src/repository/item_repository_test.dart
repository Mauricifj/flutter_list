import 'package:flutter_list/src/data/item_api.dart';
import 'package:flutter_list/src/models/item.dart';
import 'package:flutter_list/src/repository/item_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('item repository fetches items', () async {
    final repository = ItemRepository(itemApi: ItemApi());
    final items = await repository.getItems();

    expect(items, isA<List<Item>>());
    expect(items.length, 3);
  });
}