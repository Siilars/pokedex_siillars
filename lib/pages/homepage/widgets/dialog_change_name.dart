import 'package:flutter/material.dart';
import 'package:pokedex/models/pokeapi.dart';
import 'package:pokedex/stores/pokeapi_store.dart';

class DialogChangeName extends StatefulWidget {
  final Pokemon pokemon;
  final PokeApiStore pokeController;

  const DialogChangeName({Key? key, required this.pokemon, required this.pokeController}) : super(key: key);

  @override
  _DialogChangeNameState createState() => _DialogChangeNameState();
}

class _DialogChangeNameState extends State<DialogChangeName> {
  late final textEditingController = TextEditingController(text: widget.pokemon.name);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Novo nome'),
      actions: [
        TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancel')),
        ElevatedButton(
          onPressed: () async {
            widget.pokeController.changeName(pokemon: widget.pokemon, newName: textEditingController.text);
            Navigator.of(context).pop();
          },
          child: Text('Change'),
        ),
      ],
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: textEditingController,
          ),
        ],
      ),
    );
  }
}
