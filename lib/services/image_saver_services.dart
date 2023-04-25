import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImagePickSaveService {
  final picker = ImagePicker();
  Future imagePicker() async {
    final XFile? photo = await picker.pickImage(source: ImageSource.camera);
    if (photo == null) return;
    return File(photo.path); // i return temp file path 
  }

  Future<bool> imageSaver(String tempFilePath) async {
    /// `For Request New Storage Permission`
    final status = await Permission.storage.request();
    // print(permissionRequest.)
    // var status = await Permission.storage.status;
    /// `check if users give access or not if not then i returnfalse to show on ui `
    if (status.isDenied) {
      return false;
    }
    final result = await ImageGallerySaver.saveFile(tempFilePath); //worked
    if (kDebugMode) {
      print(result);
    }
    return true;
  }
}
