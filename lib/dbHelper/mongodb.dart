import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';
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
  } catch (e) {
    print("Erro: $e");
  }
}

}