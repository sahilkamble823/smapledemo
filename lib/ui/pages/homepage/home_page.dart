import 'package:flutter/material.dart';
import 'package:sahil_ps_demo/ui/pages/attendance/attendance_page.dart';
import 'package:sahil_ps_demo/ui/pages/leave/leave_page.dart';
import 'package:sahil_ps_demo/ui/pages/login/login_page.dart';
import 'package:sahil_ps_demo/ui/pages/menu/change_password.dart';
import 'package:sahil_ps_demo/ui/pages/payslip/payslip_page.dart';
import 'package:sahil_ps_demo/ui/pages/wallpost/wall_post.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../profile/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {

   var name ;

  void loadingData() async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    name = sharedPreferences.getString('name') ?? '';
    print('nameHome' +name);
    setState(()  {

    });

  }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();

      loadingData();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        title: const Text(
          'Home Page',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Container(
            width: 100,
            height: 100,
            child: Image.network('https://cryptologos.cc/logos/aave-aave-logo.png'),
          ),
        ),
      ),
      endDrawer: Drawer(
        width: 250,
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: [

             DrawerHeader(
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: Colors.amber,
              ), //BoxDecoration
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(color: Colors.transparent),
                accountName: Text(
                  "${name}",
                  style: TextStyle(fontSize: 18),
                ),
                accountEmail: Text("useremail@gmail.com"),
                currentAccountPictureSize: Size.square(50),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 165, 255, 137),
                  child: Text(
                    "E",
                    style: TextStyle(fontSize: 30.0, color: Colors.blue),
                  ), //Text
                ), //circleAvatar
              ), //UserAccountDrawerHeader
            ), //DrawerHeader
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text(' My Profile '),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProfilePage()));
              },
            ),
            ListTile(
              leading: const Icon(Icons.lock),
              title: const Text(' Change Password '),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>ChangePassword()));

              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () async {
                SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
                sharedPreferences.remove('isLogin');
                sharedPreferences.remove('name');
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                final snackbar = SnackBar(content: Text("Logout Success!"));
                ScaffoldMessenger.of(context).showSnackBar(snackbar);

              },
            ),
            ListTile(
              leading: const Icon(Icons.close),
              title: const Text('Close'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                 Padding(
                   padding: const EdgeInsets.only(left: 20,right: 20),
                   child: Container(
                     height: 200,
                     width: 400,
                     decoration: const BoxDecoration(

                     ),
                     child: Card(
                       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                       elevation: 5,
                       shadowColor: Colors.grey,
                       color: Colors.yellow,
                       child: Column(
                         children: <Widget>[
                           Padding(
                             padding: EdgeInsets.all(15.0),
                             child: CircleAvatar(
                             radius: 30,
                               foregroundImage: AssetImage("assets/images/user.png"),
                             ),
                           ),
                           SizedBox(height: 5,),
                           Text("Welcome ${name}",style: TextStyle(fontWeight:FontWeight.bold
                           ),
                           ),
                           SizedBox(height: 10,),
                           Text("Login on ",style: TextStyle(fontWeight:FontWeight.bold
                           ),
                           ),
                         ],
                       ),
                     ),
                   ),
                 ),
                // Card column
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Container(
                    height: 400,
                    width: 400,
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      elevation: 10,
                     color: Colors.grey.shade200,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: GridView.count(
                          scrollDirection: Axis.vertical,
                            crossAxisCount: 2,
                            crossAxisSpacing: 15,
                            mainAxisSpacing: 15,
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> WallPost()));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.pinkAccent,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Wall Post",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          letterSpacing: 1
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> LeavePage()));

                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.greenAccent,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Leave",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            letterSpacing: 1
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AttendancePage()));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.amberAccent,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child:const  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Attendance",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            letterSpacing: 1
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PaySlipPage()));

                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.indigoAccent,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child:const  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Payslip",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            letterSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> AttendancePage()));
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child:const  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Next Module",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                            letterSpacing: 1
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> PaySlipPage()));

                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.redAccent,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child:const  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("Next Module",
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13,
                                          letterSpacing: 1,
                                        ),
                                      ),
                                    ],
                                  ),
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
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.black,
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fingerprint),
            label: 'Punch In',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.fingerprint),
            label: 'Punch Out',
          ),
       ],
      ),
    );
  }
}
