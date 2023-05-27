//import 'dart:convert';

class CharactersModel {
  late int idCharacters;
  late String name, nickName, statusDeadOrAlive, birthday, actorName, image;
  late List<String> ocuppation;
  late List<int> apperanceInSeason;

  CharactersModel.fromJson(Map<String, dynamic> json) {
    idCharacters = json["char_id"];
    name = json["name"];
    nickName = json["nickname"];
    birthday = json["birthday"];
    actorName = json["portrayed"];
    image = json["img"];
    statusDeadOrAlive = json["status"];
    ocuppation = json["occupation"].cast<String>();
    apperanceInSeason = json["appearance"].cast<int>();
  }
}
