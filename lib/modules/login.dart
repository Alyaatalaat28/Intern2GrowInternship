import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intern_task1/cubit/cubit.dart';
import 'package:intern_task1/modules/profile.dart';
import 'package:intern_task1/modules/register.dart';

import '../cubit/states.dart';
import '../network/cashe_helper.dart';

var token;

class LoginScreen extends StatelessWidget {
   LoginScreen({super.key});
   TextEditingController userNameController =TextEditingController();
   TextEditingController passwordController =TextEditingController();
   var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
   return BlocConsumer<AppCubit,AppStates>(
    listener: (context,state){
      if(state is AppLoginSuccessState){
        if(AppCubit.get(context).isChecked){
        CacheHelper.saveData(key:'token',value:state.user!.token!).then((value) {
             token=state.user!.token;
             Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ProfileScreen()), (route) => false);
        });
      }
      else{
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ProfileScreen()), (route) => false);
      }
    }},
    builder:(context,state)=>  Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(            
              children: [
                Container(
                  height: 200.0,
                  child: Stack(
                    alignment: AlignmentDirectional.bottomCenter,
                    children: [
                      Align(
                        alignment: AlignmentDirectional.topCenter,
                     child: Container(
                          height: 140.0,
                          decoration:const BoxDecoration(
                            borderRadius: BorderRadius.only(
                              topLeft:Radius.circular(15) ,
                              topRight: Radius.circular(15),
                              bottomLeft:Radius.circular(8),
                              bottomRight: Radius.circular(8),
                            ),
                        image: DecorationImage( 
                          fit:BoxFit.cover,                       
                          image: NetworkImage('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFIo36WhTTxFT_Ew19dz06QJ9isr3N3s-miet4poqcu9G_WWmYBQRp1l0w4vO19MED9s0&usqp=CAU'),
                          
                        )
                          ),
                      )),
                        Container(
                          height: 116.0,
                          width: 116.0,
                          decoration: BoxDecoration(  
                            borderRadius: BorderRadius.circular(8),                      
                          image: const DecorationImage(
                            fit:BoxFit.cover,
                            image: NetworkImage('https://media.licdn.com/dms/image/C4D0BAQH_Mp-p53gDrg/company-logo_200_200/0/1663027328077?e=2147483647&v=beta&t=lWoqg9-XEB1K-UOleshpFzYh0bEgvNChopwCExilLKY')),
                        )),
                    ],
                  ),
                ),
               const SizedBox(
                  height:20.0
                ),
               const Text('Log in to your account',
                textAlign: TextAlign.center,              
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 20.0,
                  
                ),
                ),
               SizedBox(
                  height:20.0
                ),
                TextFormField(
                  controller: userNameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text('Username'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    
                  ),
                  validator: (value){
                    if(value!.isEmpty){
                      return 'please enter UserName';
                    }
                    return null;
                  },
                ),
                SizedBox(height:20.0),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: AppCubit.get(context).isPassword,
                  decoration: InputDecoration(
                    label: Text('Password'),
                    suffixIcon: IconButton(
                      icon:Icon(
                        AppCubit.get(context).suffix,
                      ),
                      onPressed:(){
                         AppCubit.get(context).changePasswordVisibility();
                      }
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    
                  ),
                      validator: (value){
                    if(value!.isEmpty){
                      return 'please enter UserName';
                    }
                    return null;                    
                    }
                ),
                SizedBox(height:15.0),
                ListTile(
                leading: Checkbox(value:AppCubit.get(context).isChecked , onChanged:(value){
                   AppCubit.get(context).changeCheckBox(value!);
                } ),
                title:const Text('Remember me',
                style: TextStyle( 
                  fontWeight:FontWeight.bold ,),),
                 trailing: TextButton(child:Text('Forgot Password ?',style: TextStyle(
                   fontWeight:FontWeight.bold ,
                  color: Colors.black),),
                onPressed: (){},
                )),
                SizedBox(height:10.0),
                Container(
                  width: double.infinity,
                  height: 44.0,
                  decoration: BoxDecoration(
                    color:const Color(0xff007BFF),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: TextButton(
                    child: Text('login',style: TextStyle(
                      color:Colors.white,
                    ),),
                    onPressed:(){
                      if(formKey.currentState!.validate()){
                        AppCubit.get(context).userLogin(userName: userNameController.text, password: passwordController.text);
                      }
                    } ),
                ),
               const SizedBox(height:10.0),
                Row(children: [
                const  Text('Don\'t have an account ?'),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RegisterScreen()));
                  }, child:const Text('Register',style: TextStyle(
                    fontWeight:FontWeight.bold ,
                      color:Colors.black))),
                ],)
              ],
            ),
          )),
      ),
      )
   );
  }
}