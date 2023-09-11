import 'dart:js';

import 'package:flutter/material.dart';

import '../../../data/database/DBHelper.dart';
import '../login/forgot_password.dart';
import '../login/login_page.dart';
import '../login/signup_page.dart';

class ChangePassword extends StatelessWidget {
  ChangePassword({super.key});

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey = GlobalKey<ScaffoldMessengerState>();

  DatabaseHelper dbhelper = DatabaseHelper();
  // change password method


  void changePassword(String pemail, String newPassword) async {
    final rowsUpdated = await dbhelper.updatePassword(pemail, newPassword);
    try{
      if (email.text.toString().isEmpty|| password.text.toString().isEmpty) {

      }

    }catch(e){
      print(e.toString());
    }

    print("updated pasword" + rowsUpdated.toString());
    if (rowsUpdated > 0) {
      print('Password updated!');
    } else {
      print('Password updated failed!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Change Password',
          style: TextStyle(
            fontSize: 15,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Change Password !',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // emai field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    controller: email,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.numbers_outlined),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // password field
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.grey[200],
                //     borderRadius: BorderRadius.circular(15),
                //   ),
                //   child: TextField(
                //     obscureText: true,
                //     decoration: InputDecoration(
                //       hintText: 'Current Password',
                //       prefixIcon: Icon(Icons.lock_outline_rounded),
                //       border: InputBorder.none,
                //     ),
                //
                //   ),
                // ),
                SizedBox(
                  height: 20,
                ),
                // password field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    controller: password,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'New Password',
                      prefixIcon: Icon(Icons.key_outlined),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.grey[200],
                //     borderRadius: BorderRadius.circular(15),
                //   ),
                //   child: TextField(
                //     obscureText: true,
                //     decoration: InputDecoration(
                //       hintText: 'Re-type new Password',
                //       prefixIcon: Icon(Icons.key_outlined),
                //       border: InputBorder.none,
                //     ),
                //
                //   ),
                // ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.amber),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () {
                        changePassword(email.text, password.text);
                      },
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));

                      child: Text(
                        'Login',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    TextButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(Colors.amber),
                        shape: MaterialStatePropertyAll(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
