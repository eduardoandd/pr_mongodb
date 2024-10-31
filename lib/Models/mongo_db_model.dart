// To parse this JSON data, do
//
//     final mongoDbModel = mongoDbModelFromJson(jsonString);

import 'dart:convert';

import 'package:mongo_dart/mongo_dart.dart';

MongoDbModel mongoDbModelFromJson(String str) => MongoDbModel.fromJson(json.decode(str));

String mongoDbModelToJson(MongoDbModel data) => json.encode(data.toJson());

class MongoDbModel {
    ObjectId idVeterinario;
    String nome;
    int idade;
    int anosExp;
    String cidade;
    String especealidade;

    MongoDbModel({
        required this.idVeterinario,
        required this.nome,
        required this.idade,
        required this.anosExp,
        required this.cidade,
        required this.especealidade,
    });

    factory MongoDbModel.fromJson(Map<String, dynamic> json) => MongoDbModel(
        idVeterinario: json["ID_VETERINARIO"],
        nome: json["NOME"],
        idade: json["IDADE"],
        anosExp: json["ANOS_EXP"],
        cidade: json["CIDADE"],
        especealidade: json["ESPECEALIDADE"],
    );

    Map<String, dynamic> toJson() => {
        "ID_VETERINARIO": idVeterinario,
        "NOME": nome,
        "IDADE": idade,
        "ANOS_EXP": anosExp,
        "CIDADE": cidade,
        "ESPECEALIDADE": especealidade,
    };
}
