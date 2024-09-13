
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseAuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> registerWithEmail(String email, String password, {String? username}) async{
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      print(userCredential);
      return userCredential;
    }catch(error){
      print("Error $error");
      throw("Error Create user");
    }
  }

  Future<UserCredential> loginWithEmail(String email, String password, {String? username}) async{
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
      print(userCredential);
      return userCredential;
    }catch(error){
      print("Error $error");
      throw("Error Create user");
    }
  }
}