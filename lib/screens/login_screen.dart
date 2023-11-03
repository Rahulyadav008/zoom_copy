import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:zoom_copy/resources/auth_methods.dart';
import 'package:zoom_copy/widgets/custom_button.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  _LogInScreenState createState() => _LogInScreenState();
}


final FirebaseAuth auth = FirebaseAuth.instance;

// Future<void> signup(BuildContext context) async {
//
//   final GoogleSignIn googleSignIn = GoogleSignIn();
//   final GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
//   if (googleSignInAccount != null) {
//     final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount.authentication;
//     final AuthCredential authCredential = GoogleAuthProvider.credential(idToken: googleSignInAuthentication.idToken, accessToken: googleSignInAuthentication.accessToken);
//           print("credential.....................oooooppppppppppp${authCredential}");
//
//     // Getting users credential
//     UserCredential result = await auth.signInWithCredential(authCredential);
//     print("result.....................oooooppppppppppp${result}");
//
//     User? user = result.user;
//     print("user.....................oooooppppppppppp${user}");
//
//
//     if (result != null) {
//       // Navigator.pushNamed(context, '/home');
//       // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
//     }  // if result not null we simply call the MaterialpageRoute,
//     // for go to the HomePage screen
//   }
// }

class _LogInScreenState extends State<LogInScreen> {
  final AuthMethods _authMethods=AuthMethods();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Start or join a meeting',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 38.0),
            child: Image.asset('assets/images/onboarding.jpg'),
          ),
          CustomButton(
            text: 'Google Sign In',
            onPressed: () async {
              print('challlaaaaaa');
              // signup(context);
              bool res = await _authMethods.signInWithGoogle(context);
              if (res) {
                Navigator.pushNamed(context,'/home');

              }
            },
          ),
        ],
      ),
    );
  }
}
