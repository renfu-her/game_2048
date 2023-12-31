import 'package:game_2048/enums/score_type.dart';
import 'package:game_2048/game.dart';
import 'package:game_2048/shared/gameColors.dart';
import 'package:flame/components.dart';
import 'package:flutter/material.dart';

class ScoreComponent extends TextComponent with HasGameRef<Game2048> {
  final ScoreType scoreType;
  ScoreComponent({
    required Vector2 position,
    required this.scoreType,
  }) : super(position: position, anchor: Anchor.center);

  @override
  Future<void> onLoad() async {
    this.text =
        "${scoreType == ScoreType.MaxTile ? "最大" : "分數"} ${scoreType == ScoreType.MaxTile ? "最大" : "分數"}?gameRef.gameModel.currentScore:gameRef.gameModel.currentScore}";
    this.textRenderer = TextPaint(
        style: TextStyle(
            color: appTextColor1,
            fontSize: gameRef.size.x * .08,
            fontWeight: FontWeight.bold,
            fontFamily: "Rubik"));
    return super.onLoad();
  }

  @override
  void update(double dt) {
    super.update(dt);
    this.text =
        "${scoreType == ScoreType.MaxTile ? "最大" : "分數"} : ${scoreType == ScoreType.MaxTile ? gameRef.gameModel.currentMaxTileValue : gameRef.gameModel.currentScore}";
  }
}
