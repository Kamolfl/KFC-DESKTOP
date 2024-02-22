import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:kfc_desktop/ui/categories/view/categories_screen.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:device_info_plus/device_info_plus.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final deviceInfoPlugin = DeviceInfoPlugin();
  WindowsDeviceInfo? windowsInfo;

  @override
  void initState() {
    fetchWindowsInfo();
    super.initState();
  }

  Future<void> fetchWindowsInfo() async {
    try {
      final info = await deviceInfoPlugin.windowsInfo;
      setState(() {
        windowsInfo = info;
      });
    } catch (e) {
      log('Error fetchWindowsInfo: $e');
    }
  }

  final images = [
    'assets/images/kiosk_slider_1.jpg',
    'assets/images/kiosk_slider_2.jpg',
    'assets/images/kiosk_slider_3.jpg',
    'assets/images/kiosk_slider_4.jpg',
    'assets/images/kiosk_slider_5.jpg',
  ];
  int _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    // if  (windowsInfo != null && windowsInfo!.deviceId != '{F38BBBAC-DF04-42EE-9251-7B42C1491EE7}') {
    //   return const Scaffold(
    //     body: Center(
    //       child: Text(
    //         'Ошибка: Неверный идентификатор устройства',
    //         style: TextStyle(fontSize: 20),
    //       ),
    //     ),
    //   );
    // }
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => CategoriesScreen()));
        },
        child: Stack(
          children: [
            CarouselSlider.builder(
              itemCount: images.length,
              itemBuilder: (BuildContext context, int index, realIndex) {
                final image = images[index];
                return buildImage(image, index);
              },
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: const Duration(seconds: 3),
                onPageChanged: (index, reason) {
                  setState(() {
                    _activeIndex = index;
                  });
                },
                height: double.infinity,
                viewportFraction: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: AnimatedSmoothIndicator(
                  activeIndex: _activeIndex,
                  count: images.length,
                  effect: const SlideEffect(
                    dotWidth: 30,
                    dotHeight: 30,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildImage(String urlImage, int index) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Image.asset(urlImage, fit: BoxFit.fill),
    );
  }
}