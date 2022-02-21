import 'package:flutter/material.dart';
import 'package:news_app_test/configs/colors.dart';
import 'package:news_app_test/screens/main_screen.dart';
import 'package:news_app_test/widgets/texts/big_text.dart';
import 'package:news_app_test/widgets/texts/hint_text.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final _formGlobalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            IconButton(
              color: AppColors.greyColor,
              padding: const EdgeInsets.all(0.0),
              alignment: Alignment.centerLeft,
              onPressed: () {},
              icon: const Icon(Icons.arrow_back),
            ),
            const SizedBox(height: 30.0),
            const BigText(text: 'Sign In'),
            const SizedBox(height: 30.0),
            SizedBox(
              height: 500.0,
              child: Form(
                key: _formGlobalKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormField(
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        label: HintText(text: 'username'),
                        enabledBorder: InputBorder.none,
                        border: InputBorder.none,
                        focusColor: Colors.teal,
                        hoverColor: Colors.teal,
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.greenAccent,
                            width: 2.5,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      controller: _usernameController,
                    ),
                    TextFormField(
                      cursorColor: Colors.black,
                      decoration: const InputDecoration(
                        label: HintText(text: 'password'),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.greenAccent,
                            width: 2.5,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      obscureText: true,
                      controller: _passwordController,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Checkbox(
                              value: false,
                              onChanged: (c) {},
                              side: BorderSide(color: AppColors.greyColor),
                            ),
                            const HintText(text: 'remember me'),
                          ],
                        ),
                        TextButton(
                            onPressed: () {},
                            child: HintText(
                                text: 'Forgot Password ?',
                                color: AppColors.buttonColor)),
                      ],
                    ),
                    const SizedBox(height: 50.0),
                    MaterialButton(
                      height: 50.0,
                      onPressed: () {
                        if (_usernameController.text.trim() != 'muser' ||
                            _passwordController.text.trim() != 'mpassw0rd') {
                          ScaffoldMessenger.of(context).showSnackBar(
                            (_usernameController.text.trim() == 'muser2' &&
                                    _passwordController.text.trim() ==
                                        'mpassw0rd')
                                ? const SnackBar(
                                    content: Text('this user is blocked',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0)),
                                    backgroundColor: Colors.white,
                                  )
                                : const SnackBar(
                                    content: Text(
                                        'something went wrong try again later !',
                                        style: TextStyle(
                                            color: Colors.red,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.0)),
                                    backgroundColor: Colors.white,
                                  ),
                          );
                          return;
                        } else {
                          _formGlobalKey.currentState?.save();
                          Navigator.of(context)
                              .pushReplacementNamed(MainScreen.routeName);
                        }
                      },
                      child: const Text('LOGIN',
                          style:
                              TextStyle(color: Colors.white, fontSize: 20.0)),
                      color: Colors.purple,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                    const SizedBox(height: 15.0),
                    Center(
                      child: Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        children: [
                          const HintText(text: 'New user?'),
                          TextButton(
                            onPressed: () {},
                            child: HintText(
                                text: 'Signup', color: AppColors.buttonColor),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
