import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_clone/style.dart';
import 'package:insta_clone/view/home_screen.dart';
import 'package:insta_clone/view_models/login_view_model.dart';
import 'package:provider/provider.dart';
import '../../../generated/l10n.dart';
import '../../common/components/button_with_icon.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO
      body: Container(
        child: Consumer<LoginViewModel>(
          builder: (context, model, child) {
            return model.isLoading
                ? CircularProgressIndicator()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          S.of(context).appTitle,
                          style: loginTitleTextStyle,
                        ),
                      ),
                      SizedBox(
                        height: 8.0,
                      ),
                      Center(
                        child: ButtonWithIcon(
                          iconData: FontAwesomeIcons.rightToBracket,
                          label: S.of(context).signIn,
                          onPressed: () => login(context),
                        ),
                      )
                    ],
                  );
          },
        ),
      ),
    );
  }

  login(BuildContext context) async {
    final loginViewModel = context.read<LoginViewModel>();
    await loginViewModel.signedIn();
    if (!loginViewModel.isSuccessful) {
      Fluttertoast.showToast(msg: S.of(context).signInFailed);
      return;
    }
    _openHomeScreen(context);
  }

  void _openHomeScreen(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => HomeScreen()),
    );
  }
}
