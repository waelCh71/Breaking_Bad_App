import '../data_source/remote_data_source.dart';
import '../models/bbCharacters.dart';

//Utulity: receive data from getCharactere: webServices
class CharactersRepositry {
  final CharactersWebServices charactersRepository;

  CharactersRepositry(this.charactersRepository);

  Future<List<CharactersModel>> getALLCharactersRepository() async {
    final characters = await charactersRepository.getALLCharacters();
    return characters
        .map((character) => CharactersModel.fromJson(character))
        .toList();
  }
}
