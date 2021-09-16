import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/models/pokemon_details_model.dart';
import 'package:pokedex/models/poke_model.dart';
part 'pokemon_controller.g.dart';

class PokemonController = _PokemonControllerStoreBase with _$PokemonController;

abstract class _PokemonControllerStoreBase with Store {
  Dio dio = Dio();

  @observable
  List<Pokemon> pokemonList = [];

  @observable
  PokeDetail pokeDetail = PokeDetail();

  @observable
  Pokemon _pokemonAtual = Pokemon();

  @observable
  int? pokemonAnimated;

  @computed
  Pokemon get getPokemonAtual => _pokemonAtual;

  @action
  _getPokemonDetails({required int id}) async {
    pokeDetail = await _loadPokeDetails(id);
  }

  @action
  Future<void> fetchPokemonList() async {
    pokemonList = await _loadPokeAPI();
  }

  @action
  getPokemon({required int index}) {
    return pokemonList[index];
  }

  @action
  setPokemonAtual({required Pokemon pokemon}) {
    _pokemonAtual = pokemon;
    pokemonAnimated = pokemon.id;
    _getPokemonDetails(id: pokemon.id);
  }

  @action
  changeName({required Pokemon pokemon, required String newName}) {
    pokemon.name = newName;
  }

  @action
  Widget getImage({required String numero}) {
    return CachedNetworkImage(
      placeholder: (context, url) => new Container(
        color: Colors.transparent,
      ),
      imageUrl: 'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$numero.png',
    );
  }

  Future<List<Pokemon>> _loadPokeAPI() async {
    try {
      final response = await dio.get(ConstsAPI.pokeapiURL);
      var decodeJson = jsonDecode(response.data);
      List<Pokemon> listPokemon = (decodeJson['pokemon'] as List).map((e) => Pokemon.fromMap(e)).toList();
      return listPokemon;
    } catch (error, stacktrace) {
      print("Erro ao carregar lista");
      print(stacktrace);
      return [];
    }
  }

  Future<PokeDetail> _loadPokeDetails(int id) async {
    try {
      final response = await dio.get('${ConstsAPI.pokeapiV2}$id');

      PokeDetail pokeDetails = PokeDetail.fromMap(response.data);
      return pokeDetails;
    } catch (error, stacktrace) {
      print("Erro ao mostrar info");
      print(stacktrace);
      return PokeDetail();
    }
  }
}
