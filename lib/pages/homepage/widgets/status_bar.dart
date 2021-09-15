import 'package:flutter/material.dart';
import 'package:provider/single_child_widget.dart';

class PokemonStatusBar extends StatelessWidget {
  final String status;
  final Color cor;
  final double value;

  const PokemonStatusBar({Key? key, required this.status, required this.cor, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: Icon(
            Icons.add_circle_outline_sharp,
          ),
          title: Text(
            status,
            style: TextStyle(fontFamily: 'Google', fontSize: 16),
          ),
        ),
        TweenAnimationBuilder<double>(
          tween: Tween<double>(begin: 0, end: value),
          duration: Duration(seconds: 3),
          curve: Curves.easeIn,
          builder: (context, value, child) {
            return LinearProgressIndicator(
              valueColor: AlwaysStoppedAnimation(cor),
              value: value,
              backgroundColor: Colors.transparent,
            );
          },
        )
      ],
    );
  }
}
