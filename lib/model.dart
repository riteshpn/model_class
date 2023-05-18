import 'package:flutter/material.dart';
import 'package:model_class/modelclass.dart';

class Model_class extends StatelessWidget {
  Model_class({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.blue.shade100,
        title:const Text('Model class'),
        centerTitle: true,
      ),
      body: Container(
        child: ListView.builder(
          itemCount: prod.length,
          itemBuilder: (context, index) {
            return ListTile(
              tileColor: Colors.blueGrey,
              leading: Icon(
                prod[index].leadingicon,
              ),
              title: Text(prod[index].productTitle),
              subtitle: Text(prod[index].productsubtitle),
              trailing: Text(prod[index].productprice.toString()),
            );
          },
        ),
      ),
    );
  }
}
