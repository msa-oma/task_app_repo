import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:task_app/login/widgets/log_in_form_page.dart';
import 'medications/medications_page.dart';

class GreetingAndMedicationPage extends StatelessWidget {
  final Box<dynamic> loginpar;
  const GreetingAndMedicationPage({
    Key? key,
    required this.loginpar,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    //  final loginpar = Hive.box("name");

    final login = loginpar.getAt(0);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(builder: (_) => const LogInFormWdg()),
                  (route) => false);
            },
            icon: const Icon(Icons.arrow_back)),
        title: const Center(child: Text("Medications List")),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                greeting(),
                style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
              ),
            ),
            const Divider(
              indent: 100,
              endIndent: 100,
              thickness: 1,
              color: Colors.black,
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                "user name : ${login.name} ",
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Colors.indigo),
              ),
            ),
            const Divider(
              indent: 80,
              endIndent: 80,
              thickness: 2,
              color: Colors.black,
            ),
            MedicationsList(),
          ],
        ),
      ),
    );
  }
}

String greeting() {
  var hour = DateTime.now().hour;
  if (hour < 12) {
    return ' good Morning .. ';
  }
  if (hour < 17) {
    return 'good Afternoon ..';
  }
  return 'good Evening ..';
}



/** Text(
              "name of user :$name ",
              style: TextStyle(fontSize: 24, color: Colors.indigo),
            ), */