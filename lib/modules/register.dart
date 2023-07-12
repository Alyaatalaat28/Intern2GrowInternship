import 'package:flutter/material.dart';
import 'package:intern_task1/modules/profile.dart';

import 'login.dart';

class RegisterScreen extends StatelessWidget {
   RegisterScreen({super.key});
  TextEditingController userNameController =TextEditingController();
   TextEditingController passwordController =TextEditingController();
    TextEditingController emailController =TextEditingController();
   var formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                          decoration: BoxDecoration(
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
                          image: DecorationImage(
                            fit:BoxFit.cover,
                            image: NetworkImage('https://media.licdn.com/dms/image/C4D0BAQH_Mp-p53gDrg/company-logo_200_200/0/1663027328077?e=2147483647&v=beta&t=lWoqg9-XEB1K-UOleshpFzYh0bEgvNChopwCExilLKY')),
                        )),
                    ],
                  ),
                ),
                SizedBox(
                  height:20.0
                ),
                Text('Create new account',
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
               const SizedBox(height:20.0),
                   TextFormField(
                    controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text('Email'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    
                  ),
                      validator: (value){
                    if(value!.isEmpty){
                      return 'please enter email';
                    }
                    return null;
                  },
                ),
              const  SizedBox(height:20.0),
                TextFormField(
                  controller: passwordController,
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    label: Text('Password'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    
                  ),
                      validator: (value){
                    if(value!.isEmpty){
                      return 'please enter password';
                    }
                    return null;
                  },
                ),
                SizedBox(height:15.0),
                ListTile(
                leading: Checkbox(value: false,
                 onChanged:(value){
                    
                } ),
                title:const Text('Remember me',
                style: TextStyle( 
                  fontWeight:FontWeight.bold ,),),
                 trailing:TextButton(child:Text('Have a problem ?',style: TextStyle(
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
                    child:const Text('Register',style: TextStyle(
                      color:Colors.white,
                    ),),
                    onPressed:(){
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>ProfileScreen()),(route)=>false);
                    } ),
                ),
                SizedBox(height:10.0),
                Row(children: [
                  Text('Already have an account ?'),
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                  }, child:const Text('Log in',style: TextStyle(
                    fontWeight:FontWeight.bold ,
                      color:Colors.black))),
                ],)
              ],
            ),
          )),
      ),
      );
  }
}