// ignore_for_file: empty_catches

import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:pr_mongodb/Models/mongo_db_model.dart';
import 'package:pr_mongodb/dbHelper/constant.dart';

class MongoDatabase{
  static var db, userCollection;

 static connect() async {
    try {
      db = await Db.create(MONGO_CONN_URL);
      await db.open();
      inspect(db);
      userCollection = db.collection(USER_COLLECTION);
      print("Conectado");
    } 
    catch (e) {
      print("Erro: $e");
    }
  }

  static Future<List<Map<String,dynamic>>> getData() async {
    final arrData = await userCollection.find().toList();
    return arrData;
  }

  static Future<String> insert(MongoDbModel data) async {
    try {

      var result = await userCollection.insertOne(data.toJson());

      if (result.isSuccess){
        return "Dados inseridos";
      }
      else{
        return "Há algo de errado, tente novamente";
      }

    } 
    catch (e) {
      return e.toString();
    }
  }

}