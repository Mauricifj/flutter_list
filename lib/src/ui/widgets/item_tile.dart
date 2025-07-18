import 'package:flutter/material.dart';
import 'package:flutter_list/src/models/item.dart';
import 'package:flutter_list/src/provider/favorite_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:timeago/timeago.dart' as timeago;

final currentItem = Provider<Item>((_) => throw UnimplementedError());

class ItemTile extends ConsumerWidget {
  const ItemTile({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = ref.watch(currentItem);
    final favorites = ref.watch(favoritesProvider);

    final isFav = favorites.contains(item.id);

    return ListTile(
      title: Text(item.title),
      subtitle: Text(timeago.format(item.createdAt)),
      trailing: IconButton(
        icon: Icon(isFav ? Icons.star : Icons.star_border),
        onPressed: () => ref.read(favoritesProvider.notifier).toggle(item.id),
      ),
      leading: Chip(label: Text(item.tag.displayName)),
    );
  }
}
