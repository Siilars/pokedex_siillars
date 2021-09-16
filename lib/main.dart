import 'package:flutter/material.dart';
import 'package:pokedex/pages/homepage/widgets/homepage.dart';
import 'package:pokedex/stores/pokemon_controller.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Pokedex',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
      providers: <SingleChildWidget>[
        Provider<PokemonController>(
          create: (_) => PokemonController(),
        )
      ],
    );
  }
}
