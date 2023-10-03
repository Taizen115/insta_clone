import 'package:flutter/material.dart';
import '../models/repositories/user_repository.dart';

class LoginViewModel extends ChangeNotifier {
  final UserRepository userRepository;
  LoginViewModel({required this.userRepository});

  bool isLoading = false;
  bool isSuccessful = false;


  Future<bool> isSignIn() async {
    return await userRepository.isSignIn();
  }

  Future<void> signedIn() async {
   isLoading = true;
   notifyListeners();

   isSuccessful = await userRepository.signedIn();

   isLoading = false;
   notifyListeners();

  }
}

