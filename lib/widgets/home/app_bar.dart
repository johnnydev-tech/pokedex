import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/constraints.dart';
import 'package:pokedex/configs/paths.dart';

class AppBarHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Stack(
      overflow: Overflow.visible,
      children: [
        Positioned(
          top: MediaQuery.of(context).padding.top - 240 / 2.9,
          left: screenWidth - (240 / 1.6),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Opacity(
                opacity: .1,
                child: Image.asset(
                  Paths.pokeball,
                  height: 240.0,
                  width: 240.0,
                  color: CustomColor.black,
                ),
              ),
              IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {},
              ),
            ],
          ),
        ),
        Container(
          height: 120,
          child: Column(
            children: <Widget>[
              SizedBox(height: Constants.spacerExtraLarge),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text(
                      'Pokedex',
                      style: TextStyle(
                        fontFamily: 'Google',
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
