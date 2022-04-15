import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:icare/views/auth/login.dart';
import 'package:icare/views/home.dart';

class AuthController extends GetxController {
  //Be able to access the instance variables and methods through
  // [AuthController.instance.logout]
  static AuthController instance = Get.find();

  late Rx<User?> _user;
  FirebaseAuth auth = FirebaseAuth.instance;

  @override
  void onReady() {
    super.onReady();
    _user = Rx<User?>(auth.currentUser);
    _user.bindStream(auth.userChanges());

    ever(_user, _initialScreen);
  }

  _initialScreen(User? user) {
    if (user == null) {
      Get.offAll(
        () => Login(),
      );
    } else {
      Get.offAll(() => Home());
    }
  }

  void register(String email, password, String name) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((user) {
        auth.currentUser?.updateDisplayName(name);
      });
    } catch (e) {
      Get.snackbar(
        'About User',
        'User Message',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        isDismissible: true,
        padding: const EdgeInsets.all(30),
        titleText: const Text(
          'Account Creation Failed',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  void login(String email, password) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print(currentUserClaims);
    } catch (e) {
      Get.snackbar(
        'About Login',
        'Login Message',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          'Login Failed',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  void resetPassWord(
    String email,
  ) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      Get.snackbar(
        'About Password Reset',
        'Message',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        titleText: const Text(
          'Unable to process',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }

  Future updateUserPassword(password) async {
    await auth.currentUser!.updatePassword(password);
    notifyChildrens();
  }

  //update photo
  Future updateUserPhoto(String imgUrl) async {
    await auth.currentUser!.updatePhotoURL(imgUrl);
    notifyChildrens();
  }

  Future updateDetails(
    String displayName,
    // password,
    // String photoURL,
  ) async {
    try {
      await auth.currentUser!.updateDisplayName(displayName);
      // .then((value) => auth.currentUser!.updatePassword(password))
      // .then((value) => auth.currentUser!.updatePhotoURL(photoURL));
      notifyChildrens();
    } catch (e) {
      print(e.toString());
    }
  }

  Future logout() async {
    try {
      return await auth.signOut();
    } catch (e) {
      return null;
    }
  }

  Future deleteUser() async {
    try {
      return await auth.currentUser!.delete();
    } catch (e) {
      return null;
    }
  }

  // get currentUserClaims
  Future<Map<String, dynamic>?> get currentUserClaims async {
    final user = FirebaseAuth.instance.currentUser;
    final idTokenResult = await user?.getIdTokenResult(true);
    return idTokenResult!.claims;
  }

// create a facebook user
  Future createFacebookUser(String name, String email) async {
    try {
      await auth
          .createUserWithEmailAndPassword(
        email: email,
        password: 'facebook',
      )
          .then((user) {
        auth.currentUser!.updateDisplayName(name);
      });
    } catch (e) {
      Get.snackbar(
        'About User',
        'User Message',
        backgroundColor: Colors.redAccent,
        snackPosition: SnackPosition.BOTTOM,
        isDismissible: true,
        padding: const EdgeInsets.all(30),
        titleText: const Text(
          'Account Creation Failed',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        messageText: Text(
          e.toString(),
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      );
    }
  }
}
