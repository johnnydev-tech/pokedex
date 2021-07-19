import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/paths.dart';
import 'package:pokedex/widgets/home/app_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusWidth = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
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
            child: Column(
              children: [
                SizedBox(
                  height: statusWidth,
                ),
                AppBarHome(),
                Expanded(
                  child: Container(
                    child: ListView(
                      children: [
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                        ListTile(
                          title: Text('Pokemon'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
