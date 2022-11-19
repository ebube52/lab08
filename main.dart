import 'package:flutter/material.dart';
import 'package:datstables/frequencychart.dart';
import 'post.dart';
import 'postTable.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'DataTable and Charts(Lab 8)';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: PostTable(),
    );
  }
}
