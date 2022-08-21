import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:task_app/display_problem/medications/medications_model.dart';

class MedicationsServer {
  static MedicationsServer instance = MedicationsServer();
  List<Drug> drugs = [];

  final String url =
      'https://run.mocky.io/v3/ca3a6071-32e1-4626-87ff-1a73749d49a9';

  Future<dynamic> getMedications() async {
    final response = await http.get(Uri.parse(url),
        headers: {"Content-Type": "application/json;charset=utf-8"});
    print("here");
    if (response.statusCode == 200) {
      //need to use forEach or map((e){..}).tplist
      final Map decodedJson = json.decode(response.body);
      //print(decodedJson);
      List problemsList = decodedJson["problems"];
      // print(problemsList);
      List diabetesList = problemsList.first["Diabetes"];
      //print(diabetesList);
      List medicationsList = diabetesList.first["medications"];
      //print(medicationsList);
      List medicationsClassesList = medicationsList.first["medicationsClasses"];
      // print(medicationsClassesList);
      List classNameList = medicationsClassesList.first["className"];
      //print(classNameList);
      Map classNameMap = classNameList.first;
      // print(classNameMap);
      classNameMap.forEach(
        (key, value) {
          List associatedDrug = value;
          Map drugmap = associatedDrug.first;
          var drug = Drug(
              name: drugmap["name"],
              dose: drugmap["dose"],
              strength: drugmap["strength"]);
          if (drugs.length < 2) drugs.add(drug);
        },
      );
    } else {
      print('server Error');
    }
  }
}
