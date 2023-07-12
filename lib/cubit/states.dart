import '../modules/model.dart';

abstract class AppStates{}

class AppInitialState extends AppStates{}

class AppLoginInitialState extends AppStates{}

class AppLoginSuccessState extends AppStates{
  UserLogin? user;
  AppLoginSuccessState(this.user);

}

class AppLoginErrorState extends AppStates{}

class ShopPasswordVisibilityState extends AppStates{} 

class ChangeCheckBoxState extends AppStates{} 
