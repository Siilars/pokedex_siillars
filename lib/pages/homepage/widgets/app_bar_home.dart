import 'package:flutter/material.dart';

class AppBarHome extends StatelessWidget {
  const AppBarHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 13, right: 5),
                  child: IconButton(
                    icon: Icon(Icons.menu),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Pokedex',
                style: TextStyle(fontFamily: 'Google', fontWeight: FontWeight.bold, fontSize: 28),
              ),
            ],
          )
        ],
      ),
      height: 120,
      //color: (Color.fromARGB(200, 240, 245, 210)),
    );
  }
}
