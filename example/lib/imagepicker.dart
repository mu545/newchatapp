import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickersss extends StatefulWidget {
  @override
  _ImagePickersssState createState() => _ImagePickersssState();
}

class _ImagePickersssState extends State<ImagePickersss> {
  File _pickimage = File('file.image');
  final picker = ImagePicker();
  void _Imagesources(ImageSource src) async {
    final pickImage = await picker.getImage(source: src);
    if (pickImage != null) {
      setState(() {
        _pickimage = File(pickImage.path);
      });
    } else {
      print('No image selected');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
          radius: 40,
          backgroundImage: _pickimage != null ? FileImage(_pickimage) : null,
          backgroundColor: Colors.grey,
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FlatButton.icon(
                onPressed: () => _Imagesources(ImageSource.camera),
                icon: Icon(Icons.photo_camera),
                label: Text(
                  'Add image \n from camera',
                  textAlign: TextAlign.center,
                )),
            FlatButton.icon(
                onPressed: () => _Imagesources(ImageSource.gallery),
                icon: Icon(Icons.image_outlined),
                label: Text(
                  'Add image\n from galary',
                  textAlign: TextAlign.center,
                ))
          ],
        )
      ],
    );
  }
}
