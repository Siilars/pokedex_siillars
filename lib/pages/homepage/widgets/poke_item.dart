import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/consts/consts_api.dart';
import 'package:pokedex/consts/consts_app.dart';

class PokeItem extends StatelessWidget {
  final String name;
  final int index;
  final Color color;
  final String num;
  final List<String> types;

  const PokeItem({Key? key, required this.name, required this.index, required this.color, required this.num, required this.types}) : super(key: key);

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
                child: CachedNetworkImage(
                  height: 110,
                  width: 100,
                  placeholder: (context, url) => new Container(
                    color: Colors.transparent,
                  ),
                  imageUrl: 'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/$num.png',
                ),
              ),
              Text(
                name,
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
                  types.length,
                  (index) => Container(
                    margin: EdgeInsets.only(bottom: 7),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color.fromARGB(90, 255, 255, 255)),
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        types[index].trim(),
                        style: TextStyle(fontFamily: 'Google', fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black),
                      ),
                    ),
                  ),
                )),
              )
            ],
          ),
        ),
        decoration: BoxDecoration(
          color: ConstsAPI.getColorType(type: types[0]),
          borderRadius: BorderRadius.all(
            Radius.circular(20),
          ),
        ),
      ),
    );
  }
}
