// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pr_mongodb/Models/mongo_db_model.dart';
import 'package:pr_mongodb/dbHelper/mongodb.dart';

class MongoDbDisplay extends StatefulWidget {
  const MongoDbDisplay({Key? key}) : super(key: key);

  @override
  State<MongoDbDisplay> createState() => _MongoDbDisplayState();
}

class _MongoDbDisplayState extends State<MongoDbDisplay> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: SafeArea(
        child: FutureBuilder(
          future: MongoDatabase.getData(),
          builder: (context, AsyncSnapshot snapshot) {
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            else{
              if(snapshot.hasData){
                var totalData = snapshot.data.length;
                // print("total data");
                return ListView.builder(
                  itemCount:snapshot.data.length ,
                  itemBuilder: (context, index){
                    return displayCard(MongoDbModel.fromJson(snapshot.data[index]));
                  }
                );
              }
              else{
                return Center(
                  child: Text("Não há dados a serem carregados.")
                );
              }
            }
          },
        )
      ),
    );
  }

  Widget displayCard(MongoDbModel data){
    return Card(
      child: Column(
        children: [
          // Text("${data.idVeterinario}"),
          Text("${data.nome}"),
          Text("${data.idade}"),
          Text("${data.anosExp}"),
          Text("${data.cidade}"),
          Text("${data.especealidade}"),
        ]
      ),
    );
  }
}