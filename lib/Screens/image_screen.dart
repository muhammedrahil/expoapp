import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class ImageScreen extends StatefulWidget {
  const ImageScreen({Key? key}) : super(key: key);

  @override
  _ImageScreenState createState() => _ImageScreenState();
}

class _ImageScreenState extends State<ImageScreen> {
  String netImage =
      "https://cdn.pixabay.com/photo/2020/11/28/10/09/mountains-5784153_960_720.jpg";

  File? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Image Screen',
          style: TextStyle(fontSize: 30),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        elevation: 0,
      ),
      body: Column(
        children: [
          promoCard(image),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: () => selectImage(pickFromCamera: true),
                child: Text("Capture New Image"),
              ),
              ElevatedButton(
                onPressed: () => selectImage(),
                child: Text("select Image From Gallery"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget promoCard(fileImage) {
    return AspectRatio(
      aspectRatio: 2.62 / 3,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
              image: _imageProvider(fileImage),
              fit: BoxFit.cover,
              onError: (exception, stackTrace) =>
                  Fluttertoast.showToast(msg: 'Image Not Loaded'),
            )),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(begin: Alignment.bottomRight, stops: [
                0.1,
                0.9
              ], colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.1)
              ])),
        ),
      ),
    );
  }

  ImageProvider _imageProvider(fileImage) {
    ImageProvider a;
    image == null ? a = NetworkImage(netImage) : a = FileImage(fileImage);
    return a;
  }

  void selectImage({bool pickFromCamera = false}) async {
    ImagePicker _picker = ImagePicker();

    final XFile? pickedImage = await _picker.pickImage(
        source:
            pickFromCamera == true ? ImageSource.camera : ImageSource.gallery);

    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
    } else
      Fluttertoast.showToast(msg: "No Image Selected");
  }
}
