import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kfc_desktop/my_app.dart';
import 'package:window_manager/window_manager.dart';
import 'package:video_player_win/video_player_win.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb && Platform.isWindows) WindowsVideoPlayer.registerWith();
  await windowManager.ensureInitialized();
  WindowOptions windowOptions = const WindowOptions(
    size: Size(1080, 620),
    center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
  runApp(const MyApp());
}

class MyApps extends StatefulWidget {
  const MyApps({super.key});

  @override
  State<MyApps> createState() => _MyAppsState();
}

class _MyAppsState extends State<MyApps> {
  late WinVideoPlayerController controller;

  List<String> videos = [
    "C:\\Users\\Kamolxon\\Downloads\\Telegram Desktop\\video.mp4",
    "C:\\Users\\Kamolxon\\Downloads\\Telegram Desktop\\video1.mp4",
    "C:\\Users\\Kamolxon\\Downloads\\Telegram Desktop\\video2.mp4",
  ];

  int videoIndex = 0;

  @override
  void initState() {
    super.initState();
    playVideo();
  }

  void playVideo() {
    controller = WinVideoPlayerController.file(File(videos[videoIndex]));
    controller.initialize().then((value) {
      if (controller.value.isInitialized) {
        controller.play();
        controller.addListener(() {
          if (controller.value.position >= controller.value.duration) {
            playNextVideo();
          }
        });
        setState(() {});
      } else {
        log("video file load failed");
      }
    });
  }

  void playNextVideo() async {
    if (controller.value.isInitialized) {
      controller.removeListener(() {});
      controller.pause();
      controller.dispose();
    }
    if (videoIndex < videos.length - 1) {
      videoIndex++;
    } else {
      videoIndex = 0;
    }
    playVideo();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(children: [
          Positioned(
              bottom: 0,
              child: Column(children: [
                ValueListenableBuilder(
                  valueListenable: controller,
                  builder: ((context, value, child) {
                    int minute = controller.value.position.inMinutes;
                    int second = controller.value.position.inSeconds % 60;
                    return Text("$minute:$second", style: Theme.of(context).textTheme.headline6!.copyWith(color: Colors.white, backgroundColor: Colors.black54));
                  }),
                ),
                ElevatedButton(onPressed: () => controller.play(), child: const Text("Play")),
                ElevatedButton(onPressed: () => controller.pause(), child: const Text("Pause")),
                ElevatedButton(onPressed: () => controller.seekTo(Duration(milliseconds: controller.value.position.inMilliseconds+ 10*1000)), child: const Text("Forward")),
              ])),
        ]),
      ),
    );
  }
}
