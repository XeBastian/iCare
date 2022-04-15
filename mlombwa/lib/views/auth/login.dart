import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:icare/components.dart';
import 'package:icare/controllers/auth_controller.dart';
import 'package:icare/controllers/theme.dart';
import 'package:icare/views/auth/register.dart';
import 'package:icare/views/auth/reset_password.dart';
import 'package:icare/widgets/widgets.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);

  final _emailEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.asset(
                      Constants.iconImageLink,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Form(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          //email field
                          DefaultFormField(
                            controller: _emailEditingController,
                            textInputType: TextInputType.emailAddress,
                            label: 'Email',
                            suffixICon: Icons.email,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          DefaultFormField(
                            controller: _passwordEditingController,
                            textInputType: TextInputType.visiblePassword,
                            label: 'Password',
                            suffixICon: Icons.password,
                            obscureText: true,
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          Align(
                            alignment: Alignment.topRight,
                            child: GestureDetector(
                              onTap: () {
                                HapticFeedback.heavyImpact();
                                // Go to Reset Password
                                Get.to(() => ResetPassword());
                              },
                              child: Text(
                                'Forgot Password?',
                                style: IcareTheme.inappLinksTextStyle,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  HapticFeedback.heavyImpact();

                                  AuthController.instance.login(
                                    _emailEditingController.text.trim(),
                                    _passwordEditingController.text.trim(),
                                  );
                                },
                                child: Card(
                                  color: Get.isDarkMode
                                      ? IcareTheme.darkBlue
                                      : IcareTheme.lightBlue,
                                  child: Padding(
                                    padding: const EdgeInsets.all(17.0),
                                    child: Center(
                                      child: Text(
                                        'Login',
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline4,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    bottom: 15.0, top: 20),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Do not have an Account?',
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        HapticFeedback.heavyImpact();
                                        Get.offAll(() => Register());
                                      },
                                      child: Text(
                                        '  Register',
                                        style: IcareTheme.inappLinksTextStyle,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
