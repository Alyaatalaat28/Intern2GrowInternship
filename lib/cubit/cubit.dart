import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_task1/cubit/states.dart';
import 'package:intern_task1/network/dio_helper.dart';

import '../modules/model.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit():super(AppInitialState());
  static AppCubit get(context)=>BlocProvider.of(context);

  UserLogin? user;


  void userLogin({
    required String userName,
    required String password,
  }
  ){
    DioHelper.postData(
       url: 'https://dummyjson.com/auth/login', 
       data: {
        'username':userName,
        'password':password,
       },
        ).then((value) {
          print (value.data);
          user=UserLogin.fromjson(value.data);
          emit(AppLoginSuccessState(user));
          }).catchError((error){
            print(error.toString());
          emit(AppLoginErrorState());
          });
  }

  bool isPassword=true;
  IconData suffix=Icons.visibility_off_outlined;
  void changePasswordVisibility(){
     isPassword=!isPassword;
     suffix=isPassword?Icons.visibility_off_outlined:Icons.visibility_outlined;
     emit(ShopPasswordVisibilityState());
  }

bool isChecked=false;
void changeCheckBox(bool value){
   isChecked=value;
   emit(ChangeCheckBoxState());
}

}