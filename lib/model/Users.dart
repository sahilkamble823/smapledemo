import 'dart:convert';

class Users{
   int? id;
 String username;
  String email;
  String password;

  Users({
     this.id,
    required this.username,
    required this.email,
    required this.password,
  });



  factory Users.fromJson(Map<String, dynamic> json){
     return Users(
       id: json['id'] as int,
       username: json['username: '] as String,
       email: json['email'] as String,
       password: json['password'] as String,
     );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'password': password,
    };
  }

}