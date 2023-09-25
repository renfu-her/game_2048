import 'package:audioplayers/audioplayers.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:game_2048/models/setting_score.dart';
import 'package:game_2048/shared/app_audios.dart';
import 'package:game_2048/shared/gameColors.dart';
import 'package:game_2048/widgets/menu_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class MainMenuScreen extends StatefulWidget {
  MainMenuScreen({Key? key}) : super(key: key);

  @override
  State<MainMenuScreen> createState() => _MainMenuScreenState();
}

class _MainMenuScreenState extends State<MainMenuScreen> {
  final player = AudioPlayer();
  final SettingsAndScoreModel settingsModel = Get.find<SettingsAndScoreModel>();
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height,
        width = MediaQuery.of(context).size.width;
    // print(settingsController.isInitialized.value);
    return SafeArea(
      child: GetX<SettingsAndScoreModel>(
        builder: (controller) => Scaffold(
          backgroundColor: const Color(0xff3D3A33),
          body: controller.isInitialized.value
              ? Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding:
                        EdgeInsets.only(top: width * .1, bottom: width * .2),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "經典 - 2048",
                          style: TextStyle(
                            color: appMainColor,
                            fontSize: width * .12,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Column(
                          children: [
                            MenuButton(
                                assetPath:
                                    "assets/images/svg/play-circle-svgrepo-com.svg",
                                buttonText: "遊玩",
                                onPressed: () async {
                                  if (settingsModel.soundActivated)
                                    await player.play(
                                        AssetSource(
                                            "audio/${buttonClickSound}"),
                                        volume:
                                            (settingsModel.soundVolume / 100)
                                                .toDouble());
                                  await Get.offNamed("/play");
                                }),
                            SizedBox(height: width * .05),
                            MenuButton(
                                assetPath:
                                    "assets/images/svg/adjust-svgrepo-com.svg",
                                buttonText: "調整聲音",
                                onPressed: () async {
                                  if (settingsModel.soundActivated)
                                    await player.play(
                                        AssetSource(
                                            "audio/${buttonClickSound}"),
                                        volume:
                                            (settingsModel.soundVolume / 100)
                                                .toDouble());
                                  await Get.offNamed("/sound");
                                }),
                          ],
                        ),
                        Text(
                          "最高分數 : ${controller.highestScore}",
                          style: TextStyle(
                            color: const Color(0xffF5E8DF),
                            fontSize: width * .08,
                            fontWeight: FontWeight.w700,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        // 新增的footer部分
                        GestureDetector(
                          onTap: () {
                            Get.toNamed(
                                '/privacy'); // 假設'/privacy'是你的privacy.dart的路由名稱
                          },
                          child: Padding(
                            padding:
                                EdgeInsets.only(top: 20.0), // 根據需要調整padding
                            child: Text(
                              "隱私政策",
                              style: TextStyle(
                                color: Colors.grey, // 你可以選擇適合的顏色
                                fontSize: width * .05,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Container(
                  color: appTextColor1,
                  width: width,
                  height: height,
                  child: SpinKitFadingFour(
                    size: width * .3,
                    color: appMainColor,
                  )),
        ),
      ),
    );
  }
}
