import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:intern_task1/modules/login.dart';

import 'observer.dart';


void main() {

  Bloc.observer = MyBlocObserver();
  // DioHelper.init();
  // await CacheHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
      home:LoginScreen(),
    );
  }
}

