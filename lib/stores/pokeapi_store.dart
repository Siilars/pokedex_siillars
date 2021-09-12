import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/models/pokeapi.dart';
part 'pokeapi_store.g.dart';

class PokeApiStore = _PokeApiStoreBase with _$PokeApiStore;

abstract class _PokeApiStoreBase with Store {
  Dio dio = Dio();

  @observable
  List<Pokemon> pokemonList = [];

  @action
  Future<void> fetchPokemonList() async {
    pokemonList = await _loadPokeAPI();
  }

  @action
  getPokemon({required int index}) {
    return pokemonList[index];
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
}
