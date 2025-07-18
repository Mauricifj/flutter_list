import 'tag.dart';

class Item {
  final String id;
  final String title;
  final DateTime createdAt;
  final Tag tag;

  Item({
    required this.id,
    required this.title,
    required this.createdAt,
    required this.tag,
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      title: json['title'],
      createdAt: DateTime.parse(json['createdAt']),
      tag: Tag.values.firstWhere((e) => e.name == json['tag']),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'createdAt': createdAt.toIso8601String(),
    'tag': tag.name,
  };

  Item copyWith({
  String? id,
  String? title,
  DateTime? createdAt,
  Tag? tag,
}) {
  return Item(
    id: id ?? this.id,
    title: title ?? this.title,
    createdAt: createdAt ?? this.createdAt,
    tag: tag ?? this.tag,
  );
}
}
