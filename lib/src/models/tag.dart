enum Tag {
  newTag,
  oldTag,
  hotTag;

  String get displayName {
    switch (this) {
      case Tag.newTag:
        return 'New';
      case Tag.oldTag:
        return 'Old';
      case Tag.hotTag:
        return 'Hot';
    }
  }
}
