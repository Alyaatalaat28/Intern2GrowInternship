import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_task1/modules/login.dart';

import 'cubit/cubit.dart';
import 'cubit/states.dart';
import 'modules/profile.dart';
import 'network/cashe_helper.dart';
import 'network/dio_helper.dart';
import 'observer.dart';


void main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  Widget widget;
   token=CacheHelper.getData(key:'token' );
   if(token!=null){
     widget=ProfileScreen();
   }
   else {
      widget=LoginScreen();
   }

  runApp( MyApp(startWidget: widget,));
}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({super.key, required this.startWidget});
 

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (BuildContext context) =>AppCubit(),
      child: BlocConsumer<AppCubit,AppStates>(
        listener: (context,states){},
        builder:(context,state)=> MaterialApp(
        debugShowCheckedModeBanner: false,
          home:startWidget,
        ),
      ),
    );
  }
}

