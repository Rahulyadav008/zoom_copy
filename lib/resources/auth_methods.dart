
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:zoom_copy/utils/utils.dart';

class AuthMethods{
  final FirebaseAuth _auth=FirebaseAuth.instance;
  Stream<User?> get authChanges =>_auth.authStateChanges();
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User get user => _auth.currentUser!;




  Future<bool> signInWithGoogle(BuildContext context) async{
    bool res=false ;

    try{
      final GoogleSignInAccount? googleUser=await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken,);
      UserCredential userCredential = await _auth.signInWithCredential(credential);
      User? user = userCredential.user;
      if (user != null) {
        if (userCredential.additionalUserInfo!.isNewUser) {
          print("ppppppppppp.......${user.displayName}");
          print("rrrrrrrrrrrrrrrrrrrrr..........${user.uid}");
          print("tttttttttt.........${user.photoURL}");
          _firestore.collection('users').doc(user.uid).set({
            'username': user.displayName,
            'uid': user.uid,
            'profilePhoto': user.photoURL,
          });
        }
        res = true;
        showSnackBar(context,'Login Successful');

      }
    }on FirebaseAuthException catch(e){
      print("FirebaseAuthException...........................  ${e.message}");
      showSnackBar(context, e.message!);
      res = false;
    }
    return res;
  }

  void signOut() {
    try{
      _auth.signOut();
    }catch(e){
      print(e);
    }
  }
}
