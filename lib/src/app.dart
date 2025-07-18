import 'package:flutter/material.dart';
import 'package:flutter_list/src/ui/pages/items_page.dart';

class FlutterListApp extends StatelessWidget {
  const FlutterListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: ItemsPage());
  }
}
