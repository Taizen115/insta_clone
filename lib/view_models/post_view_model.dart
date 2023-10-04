import 'dart:io';

import 'package:flutter/material.dart';
import 'package:insta_clone/data_models/location.dart';

import 'package:insta_clone/utils/constants.dart';

import '../models/repositories/post_repository.dart';
import '../models/repositories/user_repository.dart';

class PostViewModel extends ChangeNotifier{
  final UserRepository userRepository;
  final PostRepository postRepository;

  PostViewModel({required this.userRepository, required this.postRepository,});

  File? imageFile;

  Location? location;

  bool isProcessing = false;
  bool isImagePicked = false;

  Future<void> pickImage(UploadType uploadType) async {
    isImagePicked = false;
    isProcessing = true;
    notifyListeners();

    imageFile = await postRepository.pickImage(uploadType);
    print("pickImage: ${imageFile?.path}");

    location = await postRepository.getCurrentLocation();

    //TODO 位置情報

    if (imageFile != null) isImagePicked = true;
    isProcessing = false;
    notifyListeners();

  }

}