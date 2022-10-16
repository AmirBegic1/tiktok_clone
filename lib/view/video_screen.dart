import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiktok/controller/video_controller.dart';

class VideoScreen extends StatelessWidget {
  VideoScreen({Key? key}) : super(key: key);

  final VideoController videoController = Get.put(VideoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        VideoController();
        return PageView.builder(
            itemCount: videoController.videoList.length,
            controller: PageController(initialPage: 0, viewportFraction: 1),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              final data = videoController.videoList[index];
              return Stack(
                children: [],
                //////////////////////////PROVJERIT SVE ZIVO ZA VIDEO
              );
            });
      }),
    );
  }
}
