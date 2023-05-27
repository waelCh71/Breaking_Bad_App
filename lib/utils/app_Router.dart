import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelcomics/features/affiche_characters/models/bbCharacters.dart';
import 'package:marvelcomics/features/affiche_characters/repository/CharactersReposotry.dart';
import 'package:marvelcomics/features/details_characters/view/widget/detail_character.dart';
import 'package:marvelcomics/utils/constants.dart';
import '../features/affiche_characters/data_source/remote_data_source.dart';
import '../features/affiche_characters/view/affiche_characters_page.dart';
import '../features/affiche_characters/view_model/bloc/bloc/characters_bloc.dart';

class AppRoute {
  late CharactersRepositry charactersRepositry;
  late CharactersBloc charactersBloc;
  AppRoute() {
    charactersRepositry = CharactersRepositry(CharactersWebServices());
    charactersBloc = CharactersBloc(charactersRepositry);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                create: (BuildContext context) => charactersBloc,
                child: const Home()));

      case detailPage:
        final character = settings.arguments as CharactersModel;
        return MaterialPageRoute(
            builder: (_) => detailScreen(
                  characterDetail: character,
                ));
    }
  }
}
