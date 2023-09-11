import 'package:flutter/material.dart';
import 'package:sahil_ps_demo/data/database/DBHelper.dart';
import 'package:sahil_ps_demo/model/Users.dart';
import 'package:sahil_ps_demo/ui/pages/login/login_page.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController username = TextEditingController();

  DatabaseHelper dbhelper = DatabaseHelper();

// user sign in method
  void signUp() async{
    try {

      String uname = username.text.toString();
      String uemail = email.text.toString();
      String upass = password.text.toString();

      if(uname.isEmpty||uemail.isEmpty||upass.isEmpty){
        final snackbar =
        SnackBar(content: Text("Empty Field ! "));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);
      }
      else{
        await dbhelper.add(Users(
            username: uname, email: uemail, password: upass));

        final snackbar =
        SnackBar(content: Text("User Added Succesfully !"));
        ScaffoldMessenger.of(context).showSnackBar(snackbar);

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
                builder: (context) => LoginPage()),
                (route) => false);
        print(dbhelper.fetchUsers().toString());
      }

    } catch (e) {
      print(e);
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
                Text(
                  'Register To Start !',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                // username
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'UserName',
                      prefixIcon: Icon(Icons.supervised_user_circle_outlined),
                      border: InputBorder.none,
                    ),
                    controller: username,
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
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email_outlined),
                      border: InputBorder.none,
                    ),
                    controller: email,
                  ),
                ),
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
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      prefixIcon: Icon(Icons.lock_outline_rounded),
                      border: InputBorder.none,
                    ),
                    controller: password,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
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
                      shape: MaterialStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                    onPressed: signUp,
                    child: Text(
                      'SignUp',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already a User ?",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()));
                      },
                      child: Text(
                        'Login here !',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.blue),
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
