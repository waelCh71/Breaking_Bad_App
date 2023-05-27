// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:marvelcomics/global/theme/my_colors.dart';
import 'package:marvelcomics/utils/constants.dart';

import '../../models/bbCharacters.dart';

class singleCharacterShow extends StatelessWidget {
  final CharactersModel singleCharacter;

  const singleCharacterShow({super.key, required this.singleCharacter});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.all(8),
      //padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(
            color: myColor.myRed, width: 4, style: BorderStyle.solid),
        borderRadius: BorderRadius.circular(10),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, detailPage,
            arguments: singleCharacter),
        child: GridTile(
          footer: Hero(
            tag: singleCharacter.idCharacters,
            child: Container(
              alignment: Alignment.center,
              color: myColor.mygrey,
              child: Text(
                singleCharacter.name,
                style: TextStyle(
                    color: myColor.myRed,
                    fontSize: 20,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          child: singleCharacter.image.isNotEmpty
              ? FadeInImage.assetNetwork(
                  width: double.infinity,
                  height: double.infinity,
                  placeholder: loadingImage,
                  image: singleCharacter.image,
                  fit: BoxFit.cover,
                  placeholderFit: BoxFit.cover,
                )
              : Image.asset(notFoundImage),
        ),
      ),
    );
  }
}
