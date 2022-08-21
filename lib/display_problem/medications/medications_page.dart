import 'package:flutter/material.dart';
import 'package:task_app/display_problem/medications/medications_model.dart';
import 'package:task_app/display_problem/medications/medications_server.dart';

class MedicationsList extends StatelessWidget {
  MedicationsList({Key? key}) : super(key: key);
  List<Drug> drugss = MedicationsServer.instance.drugs;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
          itemBuilder: (context, index) {
            return ListTile(
                leading: CircleAvatar(
                  radius: 35,
                  backgroundColor: const Color.fromARGB(255, 4, 236, 124),
                  child: Text(
                    drugss[index].strength,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                title: Text(
                  "Drug: ${drugss[index].name}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                subtitle: Text('Dose:${drugss[index].dose}'));
          },
          separatorBuilder: (context, index) => const Divider(
              indent: 20, endIndent: 20, thickness: 1, color: Colors.black),
          itemCount: drugss.length),
    );
  }
}
