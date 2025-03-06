import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/widgets/appbar.dart';
import '../../../common/widgets/basic_app_button.dart';
import '../../../common/widgets/text_button.dart';
import '../../../core/configs/assets.dart';
import '../../../data/models/auth/signin_user_req.dart';
import '../../../domain/usecase/auth/auth.dart';
import '../../../service_locator.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);
  final TextEditingController _password = TextEditingController();
  final TextEditingController _confirmPassword = TextEditingController();
  final TextEditingController _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        _backGround(),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 25,
                ),
                Image.asset(AppImages.signInTop),
                SizedBox(
                  height: 50,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(38),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 33, vertical: 43),
                    child: Column(
                      children: [
                        _text('Email'),
                        _emailField(context),
                        const SizedBox(height: 20),
                        _text('Password'),
                        _passwordField(context),
                        const SizedBox(height: 20),
                        _text('Confirm Password'),
                        _confirmPasswordField(context)
                      ],
                    ),
                  ),
                ),
                Container(
                  transform: Matrix4.translationValues(0, -40, 0),
                  child: BasicAppButton(
                      onPressed: () async {
                        var result = await sl<SigninUseCase>().call(
                            params: SigninUserReq(
                                email: _email.text.toString(),
                                password: _password.text.toString()));
                        result.fold((l) {
                          var snackBar = SnackBar(
                            content: Text(l),
                            behavior: SnackBarBehavior.floating,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        }, (r) {
                          var snackBar = SnackBar(
                            content: Text(r),
                            behavior: SnackBarBehavior.floating,
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        });
                      },
                      title: 'LOGIN'),
                ),
                BasicTextButton(
                    onPressed: (){
                      Navigator.pushReplacementNamed(context, '/signin');
                    },
                text: 'Login', size: 18),
                const SizedBox(height: 30,),
                BasicTextButton(
                  onPressed: () {},
                  text: 'Forgot Password?',
                  size: 14
                ),
                const SizedBox(height: 50,),
              ],
            ),
          ),
        ),
      ]),
    );
  }


  Widget _backGround() {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage(AppImages.loginPageBg),
          fit: BoxFit.cover, // Ensures the image covers the entire container
        ),
      ),
    );
  }

  Widget _text(String text) {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        textAlign: TextAlign.start,
      ),
    );
  }

  Widget _emailField(BuildContext context) {
    return TextField(
      controller: _email,
      decoration:
          const InputDecoration(hintText: 'example@gmail.com').applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _passwordField(BuildContext context) {
    return TextField(
      controller: _password,
      decoration: const InputDecoration(hintText: '*******').applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _confirmPasswordField(BuildContext context) {
    return TextField(
      controller: _confirmPassword,
      decoration: const InputDecoration(hintText: '*******').applyDefaults(
        Theme.of(context).inputDecorationTheme,
      ),
    );
  }

  Widget _signinText(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Not a member?',
            style: TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
          ),
          TextButton(
              onPressed: () {
                // Navigator.pushReplacement(
                //     context,
                //     MaterialPageRoute(
                //         builder: (BuildContext context) => SignupPage()));
              },
              child: const Text(
                'Sign up',
                style: TextStyle(color: Colors.blueAccent),
              ))
        ],
      ),
    );
  }
}
