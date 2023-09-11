import 'package:flutter/material.dart';
import 'package:sahil_ps_demo/ui/pages/homepage/home_page.dart';
import 'package:sahil_ps_demo/ui/pages/login/forgot_password.dart';
import 'package:sahil_ps_demo/ui/pages/login/signup_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../data/database/DBHelper.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  DatabaseHelper dbhelper = DatabaseHelper();

  //login method
  void  login() async{

    try{
      SharedPreferences sharedPreferences =  await SharedPreferences.getInstance();

      final users =  await dbhelper.getUsersDetials();
      String uemail = email.text.toString();
      String upass = password.text.toString();
      bool isChecked = false;

      if(uemail.isEmpty||upass.isEmpty){
        final snackbar =
        SnackBar(content: Text("Empty Field ! "));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
      else{
        for(var user in users){
          if (user['email']==uemail && user['password'] == upass) {
            sharedPreferences.setBool('islogin', true);
            sharedPreferences.setString('name', user['username']);
            print(user['username']);

            isChecked = true;
            final snackbar =
            SnackBar(content: Text("Login Success !"));
            ScaffoldMessenger.of(context).showSnackBar(snackbar);

            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                    builder: (context) => HomePage()),
                    (route) => false);

            print("Login Success : $uemail");
          }
        }
        if(!isChecked){
          final snackbar =
          SnackBar(content: Text("Credential is wrong"));
          ScaffoldMessenger.of(context).showSnackBar(snackbar);
        }
      }

    }
    catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Hello Again !',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20,),
                // emai field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),

                  ),
                  child: TextField(

                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: InputBorder.none,
                    ),
                    controller: email,
                  ),
                ),
                SizedBox(height: 20,),
                // password field
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      border: InputBorder.none,
                    ),
                    controller: password,
                  ),
                ),
                SizedBox(height: 30,),
                Container(
                  width: 500,
                  height: 40,
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextButton(

                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.amber),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                      ),
                      ),
                    ),
                      onPressed: login,
                      child: Text('Login',
                      style: TextStyle(
                        color: Colors.white
                      ),
                      ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> ForgotPassword()));
                      },
                      child: Text('Forget Password?',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=> SignUpPage()));
                      },
                      child: Text('Register Here !',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.blue
                        ),
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
