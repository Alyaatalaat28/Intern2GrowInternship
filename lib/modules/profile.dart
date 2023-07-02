import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const  ProfileScreen ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
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
                Text('Ahmed Saber',
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
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text('Username'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    
                  ),
                ),
                SizedBox(height:20.0),
                   TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    label: Text('Email'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    
                  ),
                ),
                SizedBox(height:20.0),
                TextFormField(
                   keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: Text('Gender'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                    
                  ),
                ),
                SizedBox(height:15.0),
                Container(
                  width: double.infinity,
                  height: 44.0,
                  decoration: BoxDecoration(
                    color:const Color(0xfbDC3545),
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                  child: TextButton(
                    child: Text('Log out',style: TextStyle(
                      color:Colors.white,
                    ),),
                    onPressed:(){} ),
                ),
                
              ],
            ),
          )),
      ),
      );
  }
}