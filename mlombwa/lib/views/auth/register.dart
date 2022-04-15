import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:icare/components.dart';
import 'package:icare/controllers/auth_controller.dart';
import 'package:icare/controllers/theme.dart';
import 'package:icare/views/auth/login.dart';
import 'package:icare/widgets/widgets.dart';

class Register extends StatelessWidget {
  Register({Key? key}) : super(key: key);

  final _emailEditingController = TextEditingController();
  final _passwordEditingController = TextEditingController();
  final _nameEditingController = TextEditingController();

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
                child: Form(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        //email field
                        DefaultFormField(
                          controller: _nameEditingController,
                          textInputType: TextInputType.text,
                          label: 'Name',
                        ),
                        const SizedBox(
                          height: 10,
                        ),
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
                          height: 30,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                HapticFeedback.heavyImpact();
                                AuthController.instance.register(
                                    _emailEditingController.text.trim(),
                                    _passwordEditingController.text.trim(),
                                    _nameEditingController.text.trim());
                              },
                              child: Card(
                                color: Get.isDarkMode
                                    ? IcareTheme.darkBlue
                                    : IcareTheme.lightBlue,
                                child: Padding(
                                  padding: const EdgeInsets.all(17.0),
                                  child: Center(
                                    child: Text(
                                      'Register',
                                      style:
                                          Theme.of(context).textTheme.headline4,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 15.0, top: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Already have an Account?',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      HapticFeedback.heavyImpact();
                                      Get.offAll(() => Login());
                                    },
                                    child: Text(
                                      '  Login',
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
            ],
          ),
        ),
      ),
    );
  }
}
