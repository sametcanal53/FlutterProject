import 'package:flutter/material.dart';
import 'package:mobile_project/Account/logInSuccess.dart';
import 'package:mobile_project/Account/logOutSuccess.dart';
import 'package:mobile_project/Users/Users.dart';
import 'package:mobile_project/Users/UsersDao.dart';

class Profile extends StatefulWidget {
  Users user;
  Profile({required this.user});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.black),
          title: const Text("Hesap Bilgileriniz",style: TextStyle(color: Colors.black)),
        ),
        body: UpdateForm(user: widget.user)
    );
  }
}


class UpdateForm extends StatefulWidget {
  Users user;
  UpdateForm({required this.user});


  @override
  State<UpdateForm> createState() => _UpdateFormState();
}

class _UpdateFormState extends State<UpdateForm> {

  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final username = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final checkPassword = TextEditingController();


  Future<void> UpdateToUser() async{
    var user = await UsersDao().UpdateToUser(widget.user.user_id,firstname.text, lastname.text, username.text,email.text, password.text);
    return user;
  }

  Future<void> RemoveToUser(int user_id) async{
    await UsersDao().DeleteToUser(user_id);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Form(
        child: Column(
          children: [
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Sadece Değiştirmek İstediğiniz Alanları Doldurunuz.",
                  textAlign: TextAlign.center),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 30
              ),
              child: TextFormField(
                controller: firstname,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: "Ad",
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:  const BorderSide(color:Colors.black)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: const BorderSide(color:Colors.cyan)
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 30
              ),
              child: TextFormField(
                controller: lastname,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: "Lastname",
                  contentPadding:const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:const BorderSide(color:Colors.black)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color:Colors.cyan)
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 30
              ),
              child: TextFormField(
                controller: username,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: "Username",
                  contentPadding:const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:const BorderSide(color:Colors.black)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color:Colors.cyan)
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 30
              ),
              child: TextFormField(
                controller: email,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: "E-Mail",
                  contentPadding:const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:const BorderSide(color:Colors.black)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color:Colors.cyan)
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                  top: 30
              ),
              child: TextFormField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: "Şifre",
                  contentPadding:const EdgeInsets.symmetric(
                    horizontal: 40,
                    vertical: 20,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide:const BorderSide(color:Colors.black)
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(50),
                      borderSide: BorderSide(color:Colors.cyan)
                  ),
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 85,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 30
                ),
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.cyan),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          )
                      ),
                    ),
                    onPressed: (){
                      UpdateToUser();
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>LogInSuccess(user: widget.user)));
                    },
                    child: const Text("Bilgilerimi Güncelle")),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 85,
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                    top: 30
                ),
                child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                          )
                      ),
                    ),
                    onPressed: (){
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          title: const Text("Hesabı Silme İşlemi"),
                          content: const Text("Hesabı Silmek İstediğinize Emin Misiniz ?"),
                          actions: [
                            TextButton(
                                onPressed: (){
                                  Navigator.pop(context);
                                },
                                child: const Text("Geri Dön")
                            ),
                            TextButton(
                                onPressed: (){
                                  RemoveToUser(widget.user.user_id);
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => LogOutSuccess()));
                                },
                                child: const Text("Hesabı Sil")
                            ),
                          ],
                        ),
                      );
                    },
                    child: const Text("Hesabı Sil")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

