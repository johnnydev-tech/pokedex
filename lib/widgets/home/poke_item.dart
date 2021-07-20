import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/configs/colors.dart';
import 'package:pokedex/configs/paths.dart';
import 'dart:math';

class PokeItem extends StatefulWidget {
  final String name;
  final int index;
  final Color color;
  final String num;
  final List<String> types;

  const PokeItem(
      {Key key, this.name, this.index, this.color, this.num, this.types})
      : super(key: key);

  @override
  _PokeItemState createState() => _PokeItemState();
}

class _PokeItemState extends State<PokeItem> with TickerProviderStateMixin {
  AnimationController rotationController;

  @override
  void initState() {
    rotationController = AnimationController(
      duration: Duration(seconds: 15),
      value: 250,
      upperBound: pi * 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }

  Widget setTipos() {
    List<Widget> lista = [];
    widget.types.forEach((nome) {
      lista.add(
        Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Text(
                  nome.trim(),
                  style: TextStyle(
                    fontFamily: 'Google',
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 5)
          ],
        ),
      );
    });
    return Column(
      children: lista,
      crossAxisAlignment: CrossAxisAlignment.start,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: EdgeInsets.zero,
        onPressed: () {},
        child: Container(
          decoration: BoxDecoration(
            color: CustomColor.white,
            borderRadius: BorderRadius.all(
              Radius.circular(12.0),
            ),
          ),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Hero(
                      child: Opacity(
                        child: Image.asset(
                          Paths.pokeball,
                          height: 80,
                          width: 80,
                        ),
                        opacity: 0.2,
                      ),
                      tag: widget.name + 'roatation',
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
                        child: Text(
                          widget.name,
                          style: TextStyle(
                            fontFamily: 'Google',
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        // child: setTipos(),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Hero(
                      tag: widget.name,
                      child: CachedNetworkImage(
                        alignment: Alignment.bottomRight,
                        height: 80,
                        width: 80,
                        placeholder: (context, url) {
                          rotationController.forward(from: 0.0);
                          return RotationTransition(
                            turns: Tween(begin: 0.0, end: 1.0)
                                .animate(rotationController),
                            child: Image.asset(
                              Paths.pokeball,
                              height: 80,
                            ),
                          );
                        },
                        imageUrl:
                            'https://raw.githubusercontent.com/fanzeyi/pokemon.json/master/images/${widget.num}.png',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  CustomColor.getColorType(type: widget.types[0])
                      .withOpacity(.7),
                  CustomColor.getColorType(type: widget.types[0])
                ],
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(12.0),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
