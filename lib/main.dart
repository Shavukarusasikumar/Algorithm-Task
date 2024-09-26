import 'package:algorithm_task/provider/number_grid_provider.dart';
import 'package:algorithm_task/view/number_grid_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NumberGridModel(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Algorithm Viewer',
      debugShowCheckedModeBanner: false,
      home: NumberGridPage(),
    );
  }
}