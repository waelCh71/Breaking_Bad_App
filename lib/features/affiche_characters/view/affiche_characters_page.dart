import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvelcomics/features/affiche_characters/models/bbCharacters.dart';
import 'package:marvelcomics/features/affiche_characters/view/widget/body_build.dart';
import 'package:marvelcomics/features/affiche_characters/view_model/bloc/bloc/characters_bloc.dart';
import 'package:marvelcomics/global/theme/my_colors.dart';
import 'package:marvelcomics/utils/constants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<CharactersModel> allCharacters;
  //late List<CharactersModel> searchedCharacters;
  bool _isSearching = false;
  final _searchTextController = TextEditingController();
  String characterForSearch = "";

  @override
  void initState() {
    super.initState();
    allCharacters = BlocProvider.of<CharactersBloc>(context).getAllCharacters();
  }

  Widget _searchField() {
    return TextField(
      controller: _searchTextController,
      cursorColor: myColor.myRed,
      decoration: const InputDecoration(
        hintText: hintWhenSearch,
      ),
      onChanged: (String inputCharacter) {
        setState(() {
          characterForSearch = inputCharacter;
        });
      },
    );
  }

  // void searchFunction(String inputCharacter) {
  //   setState(() {

  //   });
  // }

  PreferredSizeWidget _mainAppBar() {
    return AppBar(
      title: Text(
        "Characters",
        style: TextStyle(color: myColor.myRed),
      ),
      backgroundColor: myColor.mygrey,
      actions: [
        IconButton(onPressed: _startSearch, icon: const Icon(Icons.search))
      ],
    );
  }

  void _startSearch() {
    // ModalRoute.of(context)!
    //     .addLocalHistoryEntry(LocalHistoryEntry(onRemove: _stopSearch));
    setState(() {
      _isSearching = true;
    });
  }

  PreferredSizeWidget _searchAppBar() {
    return AppBar(
      title: _searchField(),
      backgroundColor: myColor.mygrey,
      actions: [
        IconButton(onPressed: _stopSearch, icon: const Icon(Icons.cancel))
      ],
    );
  }

  void _stopSearch() {
    setState(() {
      _searchTextController.clear();
      _isSearching = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: (_isSearching ? _searchAppBar() : _mainAppBar()),
      backgroundColor: myColor.myBlack,
      body: buildBlocWidget(
        allCharacters: allCharacters,
        characterForSearch: characterForSearch,
        searchTextController: _searchTextController,
      ),
    );
  }
}
