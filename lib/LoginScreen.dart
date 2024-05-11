import 'package:firebase35/main.dart';
import 'package:firebase35/readdata.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'InsertData.dart';
import 'SignUp.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
TextEditingController email=TextEditingController();
TextEditingController password=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Welcome back',style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 10,),
            TextField(
              controller: email,
              decoration: InputDecoration(
                label: Text('Email'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: password,
              decoration: InputDecoration(
                label: Text('Password'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10)
                ),
              ),
            ),
            SizedBox(height: 10,),
            Container(
              width: 400,
              height: 50,
              decoration: BoxDecoration( 
                borderRadius: BorderRadius.circular(10),
                color: Color(0xFF246AB6)
              ),
              child: CupertinoButton(
                  onPressed: ()async{
                try {
                  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                      email: email.text,
                      password: password.text
                  );
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>streamfire()));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Success")));
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("User not found")));
                  } else if (e.code == 'wrong-password') {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wrong Password")));
                    print('Wrong password provided for that user.');
                  }
                }
              }, child: Text('Login',style: TextStyle(color: Colors.white),)),
            ),
                SizedBox(height: 10,),
                Container(
                  width: 400,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF246AB6),
                  ),
                  child: CupertinoButton(child: Text('Sign Up',style: TextStyle(color: Colors.white),), onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                  }
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
