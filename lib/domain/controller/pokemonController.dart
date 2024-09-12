import 'package:get/get.dart';
import 'package:telegram_flutter/common/utils/consts.dart';
import 'package:telegram_flutter/data/config/paginationFilter.dart';
import 'package:telegram_flutter/data/models/pokemon.dart';
import 'package:telegram_flutter/data/models/pokemonInfo.dart';
import 'package:telegram_flutter/data/repositories/pokemon_repository.dart';


class PokemonController extends GetxController {
  final PokemonRepository _pokemonRepository;
  final _pokemons = <Pokemon>[].obs;
  final Rx<PokemonInfo> _currentPokemonInfo = PokemonInfo(0, "", 0, 0, 0, []).obs;
  final _paginationFilter = PaginationFilter().obs;
  final _pokemonName = "".obs;
  final _lastPage = false.obs;

  int get _page => _paginationFilter.value.page;

  PokemonController(this._pokemonRepository);

  PokemonInfo get currentPokemonInfo => _currentPokemonInfo.value;
  var requestStateListPokemon = RequestState.IDLE.obs;
  var requestStateAPokemon = RequestState.IDLE.obs;

  List<Pokemon> get pokemons => _pokemons.toList();

  bool get lastPage => _lastPage.value;

  int get limit => _paginationFilter.value.limit;

  @override
  void onInit() {
    ever(_paginationFilter, (_) => _getNewPokemon());
    ever(_pokemonName, (_) => _getAPokemon());
    _changePaginationFilter(0, 25);
    super.onInit();
  }

  Future<void> _getNewPokemon() async {
    if (requestStateListPokemon != RequestState.LOADING) {
      await _pokemonRepository.getNewListPokemon(
        _paginationFilter.value,
        start: () => {updateStateListPokemon(RequestState.LOADING)},
        error: (error) {
          updateStateListPokemon(RequestState.ERROR);
        },
        success: (listPokemons) {
          if ((listPokemons as List<Pokemon>).isNotEmpty) {
            _pokemons.addAll(listPokemons);
            updateStateListPokemon(RequestState.SUCCESS);
          } else {
            _lastPage.value = true;
          }
        },
      );
    }
  }

  Future<void> _getAPokemon() async {
    if (requestStateAPokemon != RequestState.LOADING) {
      await _pokemonRepository.getAPokemonInfo(
        _pokemonName.value,
        start: () => {updateStateAPokemon(RequestState.LOADING)},
        error: (error) {
          updateStateAPokemon(RequestState.ERROR);
        },
        success: (pokemonInfoResponse) {
          if ((pokemonInfoResponse is PokemonInfo)) {
            _currentPokemonInfo.value = pokemonInfoResponse;
            updateStateAPokemon(RequestState.SUCCESS);
          }
        },
      );
    }
  }

  void _changePaginationFilter(int page, int limit) {
    _paginationFilter.update((val) {
      val?.page = page;
      val?.limit = limit;
    });
  }

  void updatePokemonColor(int page, String pokemonName, int color) async {
    await _pokemonRepository.updatePokemonColor(page, pokemonName, color,
        start: () => {}, error: (error) => {}, success: (response) => {});
  }

  void updateStateListPokemon(RequestState state) {
    requestStateListPokemon.value = state;
    update();
  }

  void updateStateAPokemon(RequestState state) {
    requestStateAPokemon.value = state;
    update();
  }

  void loadNextPage([bool force = false]) {
    if (force) {
      _getNewPokemon();
    } else {
      _changePaginationFilter(_page + 1, limit);
    }
  }

  void loadPokemonInfo(String pokemonName, [bool force = false]) {
    if (force) {
      _getAPokemon();
    } else {
      _pokemonName.value = pokemonName;
    }
  }
}
