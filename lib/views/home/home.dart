import 'package:flutter/material.dart';
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
