// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokemon_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokemonController on _PokemonControllerStoreBase, Store {
  Computed<Pokemon>? _$getPokemonAtualComputed;

  @override
  Pokemon get getPokemonAtual => (_$getPokemonAtualComputed ??=
          Computed<Pokemon>(() => super.getPokemonAtual,
              name: '_PokemonControllerStoreBase.getPokemonAtual'))
      .value;
  Computed<List<Move>>? _$movesFilteredComputed;

  @override
  List<Move> get movesFiltered => (_$movesFilteredComputed ??=
          Computed<List<Move>>(() => super.movesFiltered,
              name: '_PokemonControllerStoreBase.movesFiltered'))
      .value;

  final _$pokemonListAtom =
      Atom(name: '_PokemonControllerStoreBase.pokemonList');

  @override
  List<Pokemon> get pokemonList {
    _$pokemonListAtom.reportRead();
    return super.pokemonList;
  }

  @override
  set pokemonList(List<Pokemon> value) {
    _$pokemonListAtom.reportWrite(value, super.pokemonList, () {
      super.pokemonList = value;
    });
  }

  final _$pokeDetailAtom = Atom(name: '_PokemonControllerStoreBase.pokeDetail');

  @override
  PokeDetail get pokeDetail {
    _$pokeDetailAtom.reportRead();
    return super.pokeDetail;
  }

  @override
  set pokeDetail(PokeDetail value) {
    _$pokeDetailAtom.reportWrite(value, super.pokeDetail, () {
      super.pokeDetail = value;
    });
  }

  final _$_pokemonAtualAtom =
      Atom(name: '_PokemonControllerStoreBase._pokemonAtual');

  @override
  Pokemon get _pokemonAtual {
    _$_pokemonAtualAtom.reportRead();
    return super._pokemonAtual;
  }

  @override
  set _pokemonAtual(Pokemon value) {
    _$_pokemonAtualAtom.reportWrite(value, super._pokemonAtual, () {
      super._pokemonAtual = value;
    });
  }

  final _$pokemonAnimatedAtom =
      Atom(name: '_PokemonControllerStoreBase.pokemonAnimated');

  @override
  int? get pokemonAnimated {
    _$pokemonAnimatedAtom.reportRead();
    return super.pokemonAnimated;
  }

  @override
  set pokemonAnimated(int? value) {
    _$pokemonAnimatedAtom.reportWrite(value, super.pokemonAnimated, () {
      super.pokemonAnimated = value;
    });
  }

  final _$_getPokemonDetailsAsyncAction =
      AsyncAction('_PokemonControllerStoreBase._getPokemonDetails');

  @override
  Future _getPokemonDetails({required int id}) {
    return _$_getPokemonDetailsAsyncAction
        .run(() => super._getPokemonDetails(id: id));
  }

  final _$fetchPokemonListAsyncAction =
      AsyncAction('_PokemonControllerStoreBase.fetchPokemonList');

  @override
  Future<void> fetchPokemonList() {
    return _$fetchPokemonListAsyncAction.run(() => super.fetchPokemonList());
  }

  final _$_PokemonControllerStoreBaseActionController =
      ActionController(name: '_PokemonControllerStoreBase');

  @override
  dynamic getPokemon({required int index}) {
    final _$actionInfo = _$_PokemonControllerStoreBaseActionController
        .startAction(name: '_PokemonControllerStoreBase.getPokemon');
    try {
      return super.getPokemon(index: index);
    } finally {
      _$_PokemonControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPokemonAtual({required Pokemon pokemon}) {
    final _$actionInfo = _$_PokemonControllerStoreBaseActionController
        .startAction(name: '_PokemonControllerStoreBase.setPokemonAtual');
    try {
      return super.setPokemonAtual(pokemon: pokemon);
    } finally {
      _$_PokemonControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeName({required Pokemon pokemon, required String newName}) {
    final _$actionInfo = _$_PokemonControllerStoreBaseActionController
        .startAction(name: '_PokemonControllerStoreBase.changeName');
    try {
      return super.changeName(pokemon: pokemon, newName: newName);
    } finally {
      _$_PokemonControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget getImage({required String numero}) {
    final _$actionInfo = _$_PokemonControllerStoreBaseActionController
        .startAction(name: '_PokemonControllerStoreBase.getImage');
    try {
      return super.getImage(numero: numero);
    } finally {
      _$_PokemonControllerStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemonList: ${pokemonList},
pokeDetail: ${pokeDetail},
pokemonAnimated: ${pokemonAnimated},
getPokemonAtual: ${getPokemonAtual},
movesFiltered: ${movesFiltered}
    ''';
  }
}
