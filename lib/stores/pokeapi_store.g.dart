// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pokeapi_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PokeApiStore on _PokeApiStoreBase, Store {
  Computed<Pokemon>? _$getPokemonAtualComputed;

  @override
  Pokemon get getPokemonAtual => (_$getPokemonAtualComputed ??=
          Computed<Pokemon>(() => super.getPokemonAtual,
              name: '_PokeApiStoreBase.getPokemonAtual'))
      .value;

  final _$pokemonListAtom = Atom(name: '_PokeApiStoreBase.pokemonList');

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

  final _$_pokemonAtualAtom = Atom(name: '_PokeApiStoreBase._pokemonAtual');

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

  final _$pokemonAnimatedAtom = Atom(name: '_PokeApiStoreBase.pokemonAnimated');

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

  final _$fetchPokemonListAsyncAction =
      AsyncAction('_PokeApiStoreBase.fetchPokemonList');

  @override
  Future<void> fetchPokemonList() {
    return _$fetchPokemonListAsyncAction.run(() => super.fetchPokemonList());
  }

  final _$_PokeApiStoreBaseActionController =
      ActionController(name: '_PokeApiStoreBase');

  @override
  dynamic getPokemon({required int index}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.getPokemon');
    try {
      return super.getPokemon(index: index);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPokemonAtual({required Pokemon pokemon}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.setPokemonAtual');
    try {
      return super.setPokemonAtual(pokemon: pokemon);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeName({required Pokemon pokemon, required String newName}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.changeName');
    try {
      return super.changeName(pokemon: pokemon, newName: newName);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Widget getImage({required String numero}) {
    final _$actionInfo = _$_PokeApiStoreBaseActionController.startAction(
        name: '_PokeApiStoreBase.getImage');
    try {
      return super.getImage(numero: numero);
    } finally {
      _$_PokeApiStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pokemonList: ${pokemonList},
pokemonAnimated: ${pokemonAnimated},
getPokemonAtual: ${getPokemonAtual}
    ''';
  }
}
