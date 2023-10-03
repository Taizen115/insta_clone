import 'dart:io';

import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/utils/constants.dart';

import '../db/database_manager.dart';
import '../location/location_manager.dart';

class PostRepository {
  final DatabaseManager dbManager;
  final LocationManager locationManager;

  //コンストラクタ
  PostRepository({required this.dbManager, required this.locationManager});

  Future<File?> pickImage(UploadType uploadType) async {
    final imagePicker = ImagePicker();

    if (uploadType == UploadType.GALLERY){
      final pickedImage = await imagePicker.pickImage(source: ImageSource.gallery);
      return (pickedImage != null) ? File(pickedImage.path) :null;
    } else {
      final pickedImage = await imagePicker.pickImage(source: ImageSource.camera);
      return (pickedImage != null) ? File(pickedImage.path) :null;
    }
  }

  Future<Location> getCurrentLocation() async {
    return await locationManager.getCurrentLocation();
  }

}