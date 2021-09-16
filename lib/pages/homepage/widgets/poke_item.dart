import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/consts/consts_app.dart';
import 'package:pokedex/models/poke_model.dart';

class PokeItem extends StatelessWidget {
  final Pokemon pokemon;

  const PokeItem({Key? key, required this.pokemon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
              ),
              Opacity(
                child: Image.asset(
                  ConstsApp.whitePokeball,
                  height: 400,
                  width: 400,
                ),
                opacity: 0.2,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Hero(
                  tag: pokemon.id,
                  child: CachedNetworkImage(
                    height: 110,
                    width: 100,
                    placeholder: (context, url) => new Container(
                      color: Colors.transparent,
                    ),
                    imageUrl: pokemon.urlImg,
                  ),
                ),
              ),
              Text(
                pokemon.name,
                style: TextStyle(
                  fontFamily: 'Google',
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Column(
                    children: List.generate(
                  pokemon.type.length,
                  (index) => Container(
                    margin: EdgeInsets.only(bottom: 7),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color.fromARGB(90, 255, 255, 255)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        pokemon.type[index].trim(),
                        style: TextStyle(fontFamily: 'Google', fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                )),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: pokemon.typeColor,
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
