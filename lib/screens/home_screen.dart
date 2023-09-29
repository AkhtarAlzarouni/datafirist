import 'dart:convert';

import 'package:datafirist/models/product_model.dart';
import 'package:datafirist/screens/card_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ProductModel> Prodects=[
    ProductModel(name:"Shoes",catogry: "shoes",price: 30.8 ),
    ProductModel(name:"red Bag",catogry: "Bag",price: 400.0 ),
    ProductModel(name:"bag watch",catogry: "watch",price: 80.7 ),
    ProductModel(name:"orange Shoes",catogry: "shoes",price: 96.9 ),
    ProductModel(name:"blue Bag",catogry: "Bag",price: 78.0 ),
    ProductModel(name:"sport watch",catogry: "watch",price: 100.8 ),
  ];
  @override
  Widget build(BuildContext context) {
      
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.orange,
      title: Text("Prodects"),
      actions: [IconButton(onPressed: (){


        Navigator.push(context, MaterialPageRoute(builder: (context) => CardScreen(prodects: Prodects,),));
      }, icon: Icon(Icons.shopping_cart))],
      
      ),
      
      body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            trailing: IconButton(onPressed: () async{

              SharedPreferences prefs = await SharedPreferences.getInstance();

              // Prodects[index].toMap();
             String data= jsonEncode(Prodects[index].toMap());
              prefs.setString(Prodects[index].name!, data);
            }, icon: Icon(Icons.add_shopping_cart),

            
            ),
            title: Text(Prodects[index].name!),
            subtitle: Text(Prodects[index].catogry!),
            leading: Text(Prodects[index].price.toString()),
          ),
        );
      },
      
      
      itemCount:Prodects.length ,),
      
    );
   

  }
}