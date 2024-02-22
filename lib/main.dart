import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kfc_desktop/my_app.dart';
import 'package:window_manager/window_manager.dart';
import 'package:video_player_win/video_player_win.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // if (!kIsWeb && Platform.isWindows) WindowsVideoPlayer.registerWith();
  // await windowManager.ensureInitialized();
  // WindowOptions windowOptions = const WindowOptions(
  //   size: Size(1080, 650),
  //   center: true,
  //   backgroundColor: Colors.transparent,
  //   skipTaskbar: false,
  //   titleBarStyle: TitleBarStyle.hidden,
  // );
  // windowManager.waitUntilReadyToShow(windowOptions, () async {
  //   await windowManager.show();
  //   await windowManager.focus();
  // });
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


// import 'package:add_to_cart_animation/add_to_cart_animation.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Add To Cart Animation Example',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Add To Cart Animation Example'),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   MyHomePageState createState() => MyHomePageState();
// }
//
// class MyHomePageState extends State<MyHomePage> {
//   // Мы можем определить местоположение корзины с помощью этого глобального ключа<CartIconKey>
//   GlobalKey<CartIconKey> cartKey = GlobalKey<CartIconKey>();
//   late Function(GlobalKey) runAddToCartAnimation;
//   var _cartQuantityItems = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return AddToCartAnimation(
//       // Чтобы отправить в библиотеку местоположение значка корзины
//       cartKey: cartKey,
//       height: 30,
//       width: 30,
//       opacity: 0.85,
//       dragAnimation: const DragToCartAnimationOptions(
//         rotation: true,
//       ),
//       jumpAnimation: const JumpAnimationOptions(),
//       createAddToCartAnimation: (runAddToCartAnimation) {
//         // Вы можете запустить анимацию с помощью метода анимации "добавить в корзину", просто передав глобальный ключ изображения в качестве параметра
//         this.runAddToCartAnimation = runAddToCartAnimation;
//       },
//       child: Scaffold(
//         body: Column(
//           children: [
//             Expanded(
//               child: ListView(
//                 children: List.generate(15, (index) {
//                   GlobalKey widgetKey = GlobalKey();
//                   return ListTile(
//                     onTap: () async {
//                       await runAddToCartAnimation(widgetKey);
//                       await cartKey.currentState!
//                           .runCartAnimation((++_cartQuantityItems).toString());
//                     },
//                     leading: Container(
//                       key: widgetKey,
//                       width: 60,
//                       height: 60,
//                       color: Colors.transparent,
//                       child: Image.asset(
//                         'assets/images/burger.jpeg',
//                         width: 60,
//                         height: 60,
//                       ),
//                     ),
//                     title: Text(
//                       "Animated Apple Product Image $index",
//                     ),
//                   );
//                 }),
//               ),
//             ),
//             Container(
//               width: double.infinity,
//               height: 70,
//               color: Colors.blue,
//               child: AddToCartIcon(
//                 key: cartKey,
//                 icon: const Icon(Icons.shopping_cart),
//                 badgeOptions: const BadgeOptions(
//                   active: true,
//                   backgroundColor: Colors.red,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }