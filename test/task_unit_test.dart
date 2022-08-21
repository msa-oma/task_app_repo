import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_app/login/login_model.dart';

import 'package:task_app/main.dart';

void main() {
  test("task_app first test=> login model", () {
    const String name = "mohammed";
    const String password = "123456";

    final loginmodel = LoginModel(name: name, password: password);
    final result = loginmodel;

    expect(loginmodel, result);
  });

  test("greeting test", () {
    const String greeting = "";
  });

  test("should return error if the status code not equal 200", () {});
}
