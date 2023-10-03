import 'package:flutter/material.dart';
import 'package:insta_clone/view_models/post_view_model.dart';
import 'package:provider/provider.dart';
import '../../../utils/constants.dart';

class PostUploadScreen extends StatelessWidget {
  final UploadType uploadType;

  PostUploadScreen({required this.uploadType});

  @override
  Widget build(BuildContext context) {
    final postViewModel = context.read<PostViewModel>();

    if (!postViewModel.isImagePicked && !postViewModel.isProcessing){
      Future(() => postViewModel.pickImage(uploadType));
    }
    return Scaffold(
      body: Container(

      ),
    );
  }
}
