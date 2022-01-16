import 'package:flutter/material.dart';

import './my_game.dart';

class ControlButtons extends StatelessWidget {
  final MyGame game;

  const ControlButtons({
    required this.game,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back_ios),
            iconSize: 50,
            color: Colors.black,
            onPressed: () {
              game.direction = 'left';
            },
          ),
          IconButton(
            icon: Icon(Icons.multitrack_audio),
            iconSize: 50,
            color: Colors.black,
            onPressed: () {
              // do something
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward_ios),
            iconSize: 50,
            color: Colors.black,
            onPressed: () {
              game.direction = 'right';
            },
          )
        ],
      ),
    );
  }
}
