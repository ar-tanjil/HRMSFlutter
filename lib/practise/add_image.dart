import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class AddImageView extends StatefulWidget {
  const AddImageView({super.key});

  @override
  State<AddImageView> createState() => _AddImageViewState();
}

class _AddImageViewState extends State<AddImageView> {
  String imageUrl = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Image"),
      ),
      body: Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 10,
              ),
              IconButton(
                onPressed: () async {
                  ImagePicker imagePicker = ImagePicker();
                  XFile? file = await imagePicker.pickImage(
                    source: ImageSource.gallery,
                  );

                  if (file == null) {
                    return;
                  }
                  log("hi");

                  String uniqueFileName =
                      DateTime.now().microsecondsSinceEpoch.toString();

                  Reference referenceRoot = FirebaseStorage.instance.ref();
                  Reference referenceDirImages = referenceRoot.child("images");
                  Reference referenceImageToUpload =
                      referenceDirImages.child(uniqueFileName);
                  try {
                    await referenceImageToUpload.putFile(File(file!.path));
                    imageUrl = await referenceImageToUpload.getDownloadURL();
                  } catch (e) {}
                },
                icon: Icon(Icons.camera),
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(onPressed: () {}, child: const Text("Submit")),
            ],
          ),
        ),
      ),
    );
  }
}
