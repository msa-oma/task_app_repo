import 'package:hive/hive.dart';
part 'login_model.g.dart';

@HiveType(typeId: 0)
class LoginModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String password;

  LoginModel({required this.name, required this.password});
}
