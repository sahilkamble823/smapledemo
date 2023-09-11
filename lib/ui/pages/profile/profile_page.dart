import 'package:flutter/material.dart';
import 'package:sahil_ps_demo/ui/pages/homepage/home_page.dart';
import 'package:sahil_ps_demo/ui/pages/login/login_page.dart';

import '../menu/change_password.dart';


class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PaySlip',
          style: TextStyle(
            fontSize: 15,
          ),
        ),centerTitle: true,
        actions: [
          PopupMenuButton(
            elevation: 10,

              itemBuilder: (context)=>[
            // menu 1
            PopupMenuItem(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
              },
                child: Text("Edit Profile"),
            ),
            PopupMenuItem(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));

              },
              child: Text("Change Password"),

            ),
            PopupMenuItem(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));

              },
              child: Text("Send Log"),
            ),
            PopupMenuItem(
              onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));

            },
              child: Row(
                children: [
                  Icon(Icons.exit_to_app),
                  Text("LogOut"),
                ],
              ),
            ),
          ]),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
              children: [
                Card(
                  elevation: 8,
                  child: Container(
                    height: 160,
                    width: double.infinity,
                    color: Colors.yellow,
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text("Change Profile",
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                           ),
                          ),
                        ),
                        Stack(
                        children: [
                          InkWell(
                            child: CircleAvatar(
                              radius: 40,
                              foregroundImage: AssetImage("assets/images/user.png"),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: -1,
                            child: ClipRect(
                              child: Icon(Icons.add_a_photo),
                            ),
                          ),
                        ],
                        ),

                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                Card(
                  elevation: 8,
                  child: Container(
                      height: 400,
                      width: double.infinity,
                      color: Colors.grey[300],
                      child: Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView(
                            children: const  [
                              Card(
                                elevation: 10,
                                child: ExpansionTile(
                                    title:Text("Personal Detials"),
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextField(
                                          readOnly: true,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextField(
                                          readOnly: true,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextField(
                                          readOnly: true,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextField(
                                          readOnly: true,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextField(
                                          readOnly: true,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextField(
                                          readOnly: true,
                                        ),
                                      ),
                                    ],
                                ),
                              ),
                              Card(
                                elevation: 10,
                                child: ExpansionTile(
                                  title:Text("Address "),
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                        readOnly: true,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                        readOnly: true,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                        readOnly: true,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                        readOnly: true,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                        readOnly: true,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                        readOnly: true,
                                      ),
                                    ),


                                  ],
                                ),
                              ),
                              Card(
                                elevation: 10,
                                child: ExpansionTile(
                                  title:Text("Other Detials"),
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                        readOnly: true,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                        readOnly: true,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                        readOnly: true,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                        readOnly: true,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                        readOnly: true,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: TextField(
                                        readOnly: true,
                                      ),
                                    ),

                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                ),
              ],
            ),
        ),
      ),
    );
  }
}
