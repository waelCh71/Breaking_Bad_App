// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelcomics/features/affiche_characters/view/widget/single_character_item.dart';
import 'package:marvelcomics/features/affiche_characters/view_model/bloc/bloc/characters_bloc.dart';
import 'package:marvelcomics/global/theme/my_colors.dart';

import '../../models/bbCharacters.dart';

class buildBlocWidget extends StatefulWidget {
  List<CharactersModel> allCharacters;
  String characterForSearch;
  TextEditingController searchTextController;

  buildBlocWidget(
      {super.key,
      required this.allCharacters,
      required this.characterForSearch,
      required this.searchTextController});
  //buildBlocWidget({Key? key}) : super(key: key);

  @override
  State<buildBlocWidget> createState() => _buildBlocWidgetState();
}

class _buildBlocWidgetState extends State<buildBlocWidget> {
  late List<CharactersModel> searchedCharacter;

  void setSearchedCharacters(String x) {
    searchedCharacter = widget.allCharacters
        .where((characters) =>
            characters.name.toLowerCase().startsWith(x.toLowerCase()))
        .toList();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CharactersBloc, CharactersState>(
        builder: ((context, state) {
      if (state is CharactersLoaded) {
        widget.allCharacters = (state).charactor;
        setSearchedCharacters(widget.characterForSearch);
        //searchedCharacter = widget.allCharacters;
        return loadedListCharacters();
      } else {
        return Center(
          child: CircularProgressIndicator(color: myColor.myRed),
        );
      }
    }));
  }

  //TODO Search Not Found
  // searchedCharacter.isEmpty
  //       ? Center(
  //           child: Text(
  //           "Character Not Found",
  //           style: TextStyle(color: myColor.myRed, fontSize: 25),
  //         ))
  //       :

  Widget loadedListCharacters() {
    return SingleChildScrollView(
      child: Column(children: [
        buildListCharactors(),
      ]),
    );
  }

  Widget buildListCharactors() {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 2 / 3,
        mainAxisSpacing: 3,
      ),
      shrinkWrap: true,
      physics: const ClampingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: widget.searchTextController.text.isEmpty
          ? widget.allCharacters.length
          : searchedCharacter.length,
      itemBuilder: (context, index) {
        return singleCharacterShow(
            singleCharacter: widget.searchTextController.text.isEmpty
                ? widget.allCharacters[index]
                : searchedCharacter[index]);
      },
    );
  }
}
