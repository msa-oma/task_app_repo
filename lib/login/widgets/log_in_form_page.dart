import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_app/display_problem/greeting_medications.dart';
import 'package:task_app/login/login_model.dart';
import 'package:task_app/login/widgets/text_formfield_widget.dart';

import '../../display_problem/medications/medications_server.dart';

class LogInFormWdg extends StatefulWidget {
  const LogInFormWdg({Key? key}) : super(key: key);

  @override
  State<LogInFormWdg> createState() => _LogInFormWdgState();
}

class _LogInFormWdgState extends State<LogInFormWdg> {
  final _formkey = GlobalKey<FormState>();

  TextEditingController username_ctrl = TextEditingController();
  TextEditingController password_ctrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    MedicationsServer.instance.getMedications();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Icon(Icons.person_pin,
                      size: 100, color: Colors.blueGrey),
                  const Text(
                    'Login',
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent),
                  ),
                  TextFormFieldWidget(
                    controller: username_ctrl,
                    name: "user name ",
                    obscureText: false,
                  ),
                  TextFormFieldWidget(
                    controller: password_ctrl,
                    name: "password",
                    obscureText: true,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  ElevatedButton.icon(
                    label: const Text('logIn..'),
                    icon: const Icon(Icons.login),
                    onPressed: () {
                      final isValid = _formkey.currentState!.validate();
                      if (isValid) {
                        LoginModel loginModel = LoginModel(
                            name: username_ctrl.text,
                            password: password_ctrl.text);

                        final loginpar = Hive.box("name");
                        //loginpar.add(loginModel);
                        loginpar.putAt(0, loginModel);

                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(
                                builder: (_) => GreetingAndMedicationPage(
                                      loginpar: loginpar,
                                    )),
                            (route) => false);
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
