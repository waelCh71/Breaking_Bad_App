import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:marvelcomics/features/affiche_characters/repository/CharactersReposotry.dart';
//import 'package:meta/meta.dart';
import '../../../models/bbCharacters.dart';

part 'characters_event.dart';
part 'characters_state.dart';

class CharactersBloc extends Bloc<CharactersEvent, CharactersState> {
  final CharactersRepositry characterState;
  List<CharactersModel> Characters = [];
  CharactersBloc(this.characterState) : super(CharactersInitial());

  List<CharactersModel> getAllCharacters() {
    characterState.getALLCharactersRepository().then((characters) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(CharactersLoaded(characters));
      Characters = characters;
    });
    return Characters;
  }
}
