import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_app/login/widgets/log_in_form_page.dart';
import 'package:task_app/login/widgets/text_formfield_widget.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({Key? key}) : super(key: key);

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController phone_ctrl = TextEditingController();
  TextEditingController Code_ctrl = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  String verificationIDReceived = "";
  bool otpcodevisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Icon(Icons.vpn_key, size: 100, color: Colors.blueGrey),
                  const Text(
                    'Verification',
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                  TextFormFieldWidget(
                    name: 'phone number',
                    controller: phone_ctrl,
                    obscureText: false,
                    keyboardtybe: TextInputType.phone,
                  ),
                  Visibility(
                    visible: otpcodevisible,
                    child: TextFormFieldWidget(
                      name: 'Code',
                      controller: Code_ctrl,
                      obscureText: false,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      verifyNumber();
                    },
                    child: const Text('Verify ..'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                              builder: (_) => const LogInFormWdg()),
                          (route) => false);
                    },
                    child: const Text('Skip to login ..'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void verifyNumber() {
    auth.verifyPhoneNumber(
        phoneNumber: phone_ctrl.text,
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) {
            print("logged in successfuly");
          });
        },
        verificationFailed: (FirebaseAuthException exception) {
          print('Firebase Exception message : ${exception.message}');
        },
        codeSent: (String verificationID, int? resendtoken) {
          verificationIDReceived = verificationID;
          otpcodevisible = true;
          setState(() {});
        },
        codeAutoRetrievalTimeout: (String verficationID) {});
  }
}
