// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new, unused_element, prefer_interpolation_to_compose_strings

import 'dart:math';

import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mongo_dart/mongo_dart.dart' as M;
import 'package:pr_mongodb/Models/mongo_db_model.dart';
import 'package:pr_mongodb/dbHelper/mongodb.dart';

class MongoDbInsert extends StatefulWidget {
  const MongoDbInsert({Key? key}) : super(key: key);

  @override
  State<MongoDbInsert> createState() => _MongoDbInsertState();
}

class _MongoDbInsertState extends State<MongoDbInsert> {
  
  var nameController = new TextEditingController();
  var ageController = new TextEditingController();
  var expController = new TextEditingController();
  var cityController = new TextEditingController();
  var specialtyController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children:[
              Text(
                "Insirir dados",
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(height: 50,),
              TextField(
                controller: nameController,
                decoration: InputDecoration(labelText: "Nome"),
              ),
              TextField(
                controller: ageController,
                decoration: InputDecoration(labelText: "Idade"),
              ),
              TextField(
                controller: expController,
                decoration: InputDecoration(labelText: "Anos de experiência"),
              ),
              TextField(
                controller: cityController,
                decoration: InputDecoration(labelText: "Cidade"),
              ),
              TextField(
                controller: specialtyController,
                decoration: InputDecoration(labelText: "Especealidade"),
              ),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  
                  // OutlinedButton(onPressed: () {}, child: Text("Gerar dados")),
                  ElevatedButton(onPressed: () {

                    var name = nameController.text;
                    var age = int.parse(ageController.text);
                    var exp = int.parse(expController.text);
                    var city = cityController.text;
                    var speaceality = specialtyController.text;

                    _insertData(name,age,exp,city,speaceality);

                  }, 
                  child: Text("Inserir dados"))
                ],
              )
            ]
            
          ),
        ) 
      ),
    );
    
  }

  Future<void> _insertData(String name, int age, int exp, String city, String speceality) async{

    var _id = M.ObjectId();
    final data = MongoDbModel(idVeterinario: _id, nome: name, idade: age, anosExp: exp, cidade: city, especealidade: speceality);

    var result = await MongoDatabase.insert(data);

    ScaffoldMessenger.of(context)
      .showSnackBar(SnackBar(content: Text("Inserted ID" + _id.$oid)));
      _clearAll();
  }

  void _clearAll(){
    nameController.text = "";
    ageController.text = "";
    expController.text = "";
    cityController.text = "";
    specialtyController.text = "";
  }

  // void _fakeData(){
  //   setState(() {
  //     nameController.text=faker.person.firstName();
  //     ageController.text = faker.randomGenerator.integer(18,90);
  //   });
  // }
}