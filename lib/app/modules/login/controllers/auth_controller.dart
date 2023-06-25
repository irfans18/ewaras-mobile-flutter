import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../routes/app_pages.dart';

class AuthController extends GetxController {
  GoogleSignInAccount? currentUser;
  var isAuthorized = false.obs;
  var _googleSignIn = GoogleSignIn();
  FirebaseAuth _auth = FirebaseAuth.instance;
  User? user; 


  @override
  void onInit() {
    super.onInit();
    _googleSignIn.onCurrentUserChanged
        .listen((GoogleSignInAccount? account) async {
      // In mobile, being authenticated means being authorized...
      bool _isAuthorized = account != null;
      if (_isAuthorized) {
        currentUser = account;
        isAuthorized.value = _isAuthorized;
      }
    });

    _googleSignIn.signInSilently();
    debugPrint(getCurrentUserId());
    // debugPrint(currentUser?.value.displayName);
  }

  @override
  void onReady() {
    super.onReady();
    if (currentUser != null) redirectOffHome();
  }

  @override
  void onClose() {}

  String getCurrentUserId() {
    user = FirebaseAuth.instance.currentUser;
    String? userId = user?.uid;
    return userId ?? '';
  }

  Future<void> handleSignUp() async {
    try {
      // await _googleSignIn.signIn();
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _gAuthentication = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
            idToken: _gAuthentication.idToken,
            accessToken: _gAuthentication.accessToken);
        await _auth.signInWithCredential(_credential);
        await saveAccountInfoToDatabase(account);
        redirectOffHome();
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> handleSignIn() async {
    try {
      // await _googleSignIn.signIn();
      GoogleSignInAccount? account = await _googleSignIn.signIn();
      if (account != null) {
        final _gAuthentication = await account.authentication;
        final _credential = GoogleAuthProvider.credential(
            idToken: _gAuthentication.idToken,
            accessToken: _gAuthentication.accessToken);
        await _auth.signInWithCredential(_credential);
        // await saveAccountInfoToDatabase(account);
        redirectOffHome();
      }
    } catch (error) {
      print(error);
    }
  }

  Future<void> saveAccountInfoToDatabase(GoogleSignInAccount account) async {
    getCurrentUserId();
    DatabaseReference ref = FirebaseDatabase.instance.ref("users/${user!.uid}");
    try {
      await ref.update({
        "userId": user!.uid,
        "email": account.email,
        "name": account.displayName,
        "photoUrl": account.photoUrl
        // Add more fields as needed
      });
      print("…...saved user data...");
    } catch (e) {
      print('Failed to save account info to database: $e');
    }
  }

  // Future<void> saveUser(GoogleSignInAccount account) async {
  //   currentUser = account;
  //   FirebaseFirestore.instance.collection("users").doc(account.email).set({
  //     "userId": account.id,
  //     "email": account.email,
  //     "name": account.displayName,
  //     "photoUrl": account.photoUrl
  //   });
  //   print("…...saved user data...");
  // }

  Future<void> handleSignOut() => _googleSignIn.disconnect();

  redirectToRegister() {
    Get.toNamed(Routes.REGISTER);
  }

  redirectOffHome() {
    Get.offNamed(Routes.HOME);
  }
}
