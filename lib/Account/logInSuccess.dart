import 'package:flutter/material.dart';
import 'package:mobile_project/Account/logOutSuccess.dart';
import 'package:mobile_project/Account/profile.dart';
import 'package:mobile_project/Users/Users.dart';
import 'package:mobile_project/main.dart';

class LogInSuccess extends StatefulWidget {
  Users user;
  LogInSuccess({required this.user});

  @override
  State<LogInSuccess> createState() => _LogInSuccessState();
}

class _LogInSuccessState extends State<LogInSuccess> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Profil",style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children:[
          SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                // image
                SizedBox(height: 20),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20,vertical: 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                        backgroundColor: MaterialStateProperty.all(Color(0xFFF5F6F9)),
                        elevation: MaterialStateProperty.all(0),
                        padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                      ),
                      onPressed: (){},
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left:10),
                              child: Row(
                                children: [
                                  Text("Hoşgeldiniz , ",
                                    style: TextStyle(color: Colors.black,fontSize:18,fontWeight:FontWeight.w400),),
                                  Text("${widget.user.user_firstname} ${widget.user.user_lastname}",
                                    style: TextStyle(color: Colors.black,fontSize:18,fontWeight:FontWeight.bold),),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20,vertical: 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                        backgroundColor: MaterialStateProperty.all(Color(0xFFF5F6F9)),
                        elevation: MaterialStateProperty.all(0),
                        padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile(user: widget.user)));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.account_circle, color: Colors.cyan),
                          SizedBox(height: 25),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left:10),
                              child: Text("Hesap Bilgileriniz",
                                style: TextStyle(color: Colors.black,fontSize:18,fontWeight:FontWeight.w400),),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile(user: widget.user)));
                            },
                            child: Icon(Icons.arrow_forward_ios_outlined, color: Colors.black),
                            style: ButtonStyle(
                              minimumSize:MaterialStateProperty.all(Size(0,0)),
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:20,vertical: 10),
                    child: ElevatedButton(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                        backgroundColor: MaterialStateProperty.all(Color(0xFFF5F6F9)),
                        elevation: MaterialStateProperty.all(0),
                        padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                      ),
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                      },
                      child: Row(
                        children: [
                          Icon(Icons.home, color: Colors.cyan),
                          SizedBox(height: 25),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsets.only(left:10),
                              child: Text("Anasayfaya Git",
                                style: TextStyle(color: Colors.black,fontSize:18,fontWeight:FontWeight.w400),),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                            },
                            child: Icon(Icons.arrow_forward_ios_outlined, color: Colors.black),
                            style: ButtonStyle(
                              minimumSize:MaterialStateProperty.all(Size(0,0)),
                              backgroundColor: MaterialStateProperty.all(Colors.transparent),
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: LogOut(),
    );
  }
}

class LogOut extends StatefulWidget {
  const LogOut({Key? key}) : super(key: key);

  @override
  State<LogOut> createState() => _LogOutState();
}

class _LogOutState extends State<LogOut> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:20,vertical: 50),
      child: ElevatedButton(
        style: ButtonStyle(
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
          backgroundColor: MaterialStateProperty.all(Color(0xFFF5F6F9)),
          elevation: MaterialStateProperty.all(0),
          padding: MaterialStateProperty.all(EdgeInsets.all(20)),
        ),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context)=>LogOutSuccess()));
        },
        child: Row(
          children: [
            Icon(Icons.logout, color: Colors.cyan),
            SizedBox(height: 25),
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left:10),
                child: Text("Çıkış Yap",
                  style: TextStyle(color: Colors.black,fontSize:18,fontWeight:FontWeight.w400),),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>LogOutSuccess()));
              },
              child: Icon(Icons.arrow_forward_ios_outlined, color: Colors.black),
              style: ButtonStyle(
                minimumSize:MaterialStateProperty.all(Size(0,0)),
                backgroundColor: MaterialStateProperty.all(Colors.transparent),
                elevation: MaterialStateProperty.all(0),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

