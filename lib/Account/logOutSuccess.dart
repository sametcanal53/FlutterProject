import 'package:flutter/material.dart';
import 'package:mobile_project/Account/logIn.dart';
import 'package:mobile_project/Account/signUp.dart';

class LogOutSuccess extends StatefulWidget {
  const LogOutSuccess({Key? key}) : super(key: key);

  @override
  State<LogOutSuccess> createState() => _LogOutSuccessState();
}

class _LogOutSuccessState extends State<LogOutSuccess> {
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
        children:const [
          ProfileSummary(),
        ],
      ),
    );
  }
}

class ProfileSummary extends StatefulWidget {
  const ProfileSummary({Key? key}) : super(key: key);

  @override
  State<ProfileSummary> createState() => _ProfileSummaryState();
}

class _ProfileSummaryState extends State<ProfileSummary> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Aradaya boşluk koymak için sizedbox kullandım
        SizedBox(height: 20),
        Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal:20,vertical: 10),
            child: Column(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                    backgroundColor: MaterialStateProperty.all(Color(0xFFF5F6F9)),
                    elevation: MaterialStateProperty.all(0),
                    padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn()));
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left:10),
                          child: Text("Giriş Yap",
                            style: TextStyle(color: Colors.black,fontSize:18,fontWeight:FontWeight.w400),),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>LogIn()));
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
                SizedBox(height: 25),
                ElevatedButton(
                  style: ButtonStyle(
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(15))),
                    backgroundColor: MaterialStateProperty.all(Color(0xFFF5F6F9)),
                    elevation: MaterialStateProperty.all(0),
                    padding: MaterialStateProperty.all(EdgeInsets.all(20)),
                  ),
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
                  },
                  child: Row(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(left:10),
                          child: Text("Kayıt Ol",
                            style: TextStyle(color: Colors.black,fontSize:18,fontWeight:FontWeight.w400),),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
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

              ],
            ),
          ),
        ),
      ],
    );
  }
}