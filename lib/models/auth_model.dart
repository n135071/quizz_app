import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:quizapp/models/questioncontroler.dart';

class Authen {
  QuistionController quistionController=QuistionController();
  Future<Object> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;
    final OAuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
  bool valid(){
    var user=FirebaseAuth.instance.currentUser;
    if(user!= null){
      return true;
    }
    else{
      return false;
    }
  }
   signOut()async{
    
    await  FirebaseAuth.instance.signOut();
    await GoogleSignIn().disconnect();
    await GoogleSignIn().signOut();

  }
}
