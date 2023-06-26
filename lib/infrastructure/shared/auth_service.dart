//
//
//
// class AuthService {
//   final GoogleSignIn _googleSignIn = GoogleSignIn();
//
//   Future<User?> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
//       final GoogleSignInAuthentication googleAuth =
//       await googleUser!.authentication;
//
//       final OAuthCredential credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth.accessToken,
//         idToken: googleAuth.idToken,
//       );
//
//       final UserCredential userCredential =
//       await FirebaseAuth.instance.signInWithCredential(credential);
//
//       final User? user = userCredential.user;
//       return user;
//     } catch (e) {
//       print('Sign in with Google failed: $e');
//       return null;
//     }
//   }
// }
