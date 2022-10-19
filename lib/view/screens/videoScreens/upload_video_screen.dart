import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'confirmVideos.dart';

class UploadVideo extends StatefulWidget {
  const UploadVideo({Key? key}) : super(key: key);

  @override
  State<UploadVideo> createState() => _UploadVideoState();
}

pickVideo(ImageSource src, BuildContext context) async {
  final video = await ImagePicker().pickVideo(source: src);
  if (video != null) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => ConfirmVideoScreen(
            videoFile: File(video.path), videoPath: video.path),
      ),
    );
  }
}

optionMenu(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) => SimpleDialog(
      children: [
        SimpleDialogOption(
          onPressed: () {
            pickVideo(ImageSource.gallery, context);
          },
          child: Row(
            children: const [
              Icon(Icons.image),
              Padding(
                padding: EdgeInsets.all(7.0),
                child: Text(
                  'Gallery',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
        SimpleDialogOption(
          onPressed: () => Navigator.of(context).pop(),
          child: Row(
            children: const [
              Icon(Icons.cancel),
              Padding(
                padding: EdgeInsets.all(7.0),
                child: Text(
                  'Cancel',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

class _UploadVideoState extends State<UploadVideo> {
  File? pickedVideo;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => optionMenu(context),
          child: Container(
            width: 190,
            height: 50,
            decoration: BoxDecoration(color: Colors.red),
            child: const Center(
              child: Text(
                'Add video',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
