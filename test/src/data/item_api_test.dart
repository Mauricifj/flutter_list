import 'package:flutter_list/src/data/item_api.dart';
import 'package:flutter_list/src/models/item.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('item api fetches items', () async {
    final api = ItemApi();
    final items = await api.fetchItems();

    expect(items, isA<List<Item>>());
    expect(items.length, 3);
  });
}