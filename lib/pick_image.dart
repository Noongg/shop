import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_1/show_image.dart';

class PickImage extends StatefulWidget {
  const PickImage({Key? key}) : super(key: key);

  @override
  _PickImageState createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  /// Variables
  File? imageFile;

  /// Widget
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image Picker"),
        ),
        body: SizedBox(
            width: Get.width,
            height: Get.height,
            child: Column(
              children: [
                imageFile == null
                    ? Center(
                        child: ElevatedButton(
                          onPressed: () {
                            _getFromGallery();
                          },
                          child: Text("PICK FROM GALLERY"),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {
                          Get.to(ShowImage(file: imageFile));
                        },
                        child: Column(
                          children: [
                            Image.file(
                              imageFile!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.contain,
                            )
                          ],
                        ),
                      ),
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      imageFileList=[];
                      selectImages();
                    },
                    child: Text("PICK LIST FROM GALLERY"),
                  ),
                ),
                SizedBox(
                  height: 400,
                  width: Get.width,
                  child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            Get.to(ShowImage(file: File(imageFileList![index].path)));
                          },
                          child: SizedBox(
                              height: 100,
                              width: 100,
                              child: Image.file(
                                File(imageFileList![index].path),
                                width: 100,
                                height: 100,
                                fit: BoxFit.contain,
                              ),
                          ),
                        );
                      }),
                )
              ],
            )));
  }

  /// Get from gallery
  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
        maxHeight: 1800, maxWidth: 1800, source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  final ImagePicker imagePicker = ImagePicker();
  List<XFile>? imageFileList = [];
  void selectImages() async {
    final List<XFile>? selectedImages = await imagePicker.pickMultiImage();
    if (selectedImages!.isNotEmpty) {
      imageFileList!.addAll(selectedImages);
    }
    print("Image List Length:" + imageFileList!.length.toString());

    setState(() {});
  }
}
