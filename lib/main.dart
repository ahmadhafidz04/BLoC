import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la20_bloc/bloc/appbloc.dart';
import 'package:la20_bloc/page/halaman1Page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => AppBloc(),
        child: Halaman1Page(),
      ),
    );
  }
}
