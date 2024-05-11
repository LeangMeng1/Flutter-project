import 'package:firebase35/InsertData.dart';
import 'package:firebase35/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class streamfire extends StatelessWidget {
  const streamfire({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View Data",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(onPressed: (){
        }, icon: Icon(Icons.arrow_back,color: Colors.black,)),
        actions: [
          IconButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
          }, icon: Icon(Icons.logout,color: Colors.black,)),
          SizedBox(width: 20,),
          IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>HomeScreen()));
          }, icon:Icon(Icons.add,color: Colors.black,)
          ),
        ],
      ),
      body: StreamBuilder(
          stream: FirebaseFirestore.instance.collection("meng").snapshots(),
          builder: (BuildContext context,AsyncSnapshot<QuerySnapshot>snapshot){
            if(!snapshot.hasData){
              return const Center(
                child: CircularProgressIndicator(),
              );
            }return ListView(
              scrollDirection: Axis.vertical,
              children: snapshot.data!.docs.map((snap) {
                return Card(
                  child: ListTile(
                    onTap: (){
                      //  Get.to(HistoryDetail(documentSnapshot: snap,));
                    },
                    leading: CircleAvatar(
                      radius: 30,
                      backgroundImage: NetworkImage("${snap['image']}"),
                    ),
                    title: Text(" ${snap['name']}"),
                    subtitle: Text("Age ${snap['age']}"),
                    trailing: Text("Salary: ${snap['salary']}"),
                    //subtitle: Text("Date ${snap['Date'].toDate().toString()}"),
                    // subtitle: Text("Order ID ${snap['PaymentID']}"),
                  ),
                );
              }).toList(),
            );
          }
          ),
    );
  }
}