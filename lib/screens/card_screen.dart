import 'dart:convert';

import 'package:datafirist/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CardScreen extends StatefulWidget {
   CardScreen({super.key,required this.prodects});
  List<ProductModel> prodects ;

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {

  void initState(){
    _getData();
    super.initState();
  }
   List<ProductModel> cartProducts=[];
  _getData()async {
     SharedPreferences prefs = await SharedPreferences.getInstance();
     for (var element in widget.prodects) {
       
       if (prefs.containsKey(element.name!)) {
        cartProducts.add(element);
         
       }
     }

     setState(() {
       
     });
    //  String data= prefs.getString("shose") ?? "";
    //  Map<String, dynamic> map =jsonDecode(data);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Cart"),
      ),

    body: ListView.builder(itemBuilder: (context, index) {
        return Card(
          child: ListTile(
            trailing: InkWell(
              onTap: () async{
                 SharedPreferences prefs = await SharedPreferences.getInstance();
                 prefs.remove(cartProducts[index].name!);
                 cartProducts.remove(cartProducts[index]);
                 setState(() {
                   
                 });

              },
              child: Text("Remove from card")
           
            ),
            title: Text(cartProducts[index].name!),
            subtitle: Text(cartProducts[index].catogry!),
            leading: Text(cartProducts[index].price.toString()),
          ),
        );
      },
      
      
      itemCount:cartProducts.length ,),
    );
  }
}