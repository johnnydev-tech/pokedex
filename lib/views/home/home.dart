import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/paths.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            top: -(240 / 2),
            child: Opacity(
              opacity: .1,
              child: Image.asset(
                Paths.pokeball,
                height: 240.0,
                width: 240.0,
                color: CustomColor.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
