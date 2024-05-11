import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase35/LoginScreen.dart';
import 'package:firebase35/readdata.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
   HomeScreen({Key? key}) : super(key: key);
   TextEditingController name = TextEditingController();
   TextEditingController age = TextEditingController();
   TextEditingController salary=TextEditingController();
   TextEditingController image=TextEditingController();
   CollectionReference users = FirebaseFirestore.instance.collection('meng');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('InsertScreen',style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
          Navigator.pop(context);
        }, icon:Icon(Icons.arrow_back,color: Colors.black,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: name,
              decoration: InputDecoration(
                label: Text('Name'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: age,
              decoration: InputDecoration(
                label: Text('Age'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: salary,
              decoration: InputDecoration(
                label: Text('Salary'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 10,),
            TextField(
              controller: image,
              decoration: InputDecoration(
                label: Text('Image'),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
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
              child: CupertinoButton(onPressed: (){
               try{
                 users.add({
                   'name':name.text,
                   'age':age.text,
                   'salary':salary.text,
                   'image':image.text,
                 }
                 );
                 name.text ="";
                 age.text="";
                 salary.text="";
                 image.text="";
                 ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Insert Success")));
               }catch (e){

               }
              }, child: Text("Insert",style: TextStyle(color: Colors.white),)),
            ),
          ],
        ),
      ),
    );
  }
}
