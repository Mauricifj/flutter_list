import 'package:flutter/material.dart';
import 'package:flutter_list/src/provider/favorite_provider.dart';
import 'package:flutter_list/src/provider/item_provider.dart';
import 'package:flutter_list/src/ui/widgets/item_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ItemsPage extends ConsumerWidget {
  const ItemsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemsAsync = ref.watch(filteredItemsProvider);
    final favCount = ref.watch(favCountProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Items'),
        actions: [Badge(label: Text(favCount.toString()))],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(56),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              onChanged: (query) {
                ref.read(searchQueryProvider.notifier).state = query;
              },
              decoration: const InputDecoration(
                hintText: 'Search...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ),
      body: itemsAsync.when(
        data: (items) => ListView.builder(
          itemCount: items.length,
          itemBuilder: (_, i) => ProviderScope(
            overrides: [currentItem.overrideWithValue(items[i])],
            child: const ItemTile(),
          ),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (_, __) => const Center(child: Text('Error')),
      ),
    );
  }
}
