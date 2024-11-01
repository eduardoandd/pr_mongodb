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
        idVeterinario: json["ID_VETERINARIO"] is String
            ? ObjectId.fromHexString(json["ID_VETERINARIO"] as String)
            : (json["ID_VETERINARIO"] is ObjectId 
                ? json["ID_VETERINARIO"] as ObjectId 
                : ObjectId()), 
        nome: json["NOME"] ?? '',
        idade: json["IDADE"] ?? 0,
        anosExp: json["ANOS_EXP"] ?? 0,
        cidade: json["CIDADE"] ?? '',
        especealidade: json["ESPECEALIDADE"] ?? '',
    );

    Map<String, dynamic> toJson() => {
        "ID_VETERINARIO": idVeterinario.toHexString(),
        "NOME": nome,
        "IDADE": idade,
        "ANOS_EXP": anosExp,
        "CIDADE": cidade,
        "ESPECEALIDADE": especealidade,
    };
}
