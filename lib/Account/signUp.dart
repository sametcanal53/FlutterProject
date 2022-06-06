import 'package:flutter/material.dart';
import 'package:mobile_project/Account/logIn.dart';
import 'package:mobile_project/Users/UsersDao.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Kayıt Ol",style: TextStyle(color: Colors.black)),
      ),
      body: signUpBody(),
    );
  }
}

class signUpBody extends StatefulWidget {
  const signUpBody({Key? key}) : super(key: key);

  @override
  State<signUpBody> createState() => _signUpBodyState();
}

class _signUpBodyState extends State<signUpBody> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: const [
            Padding(
              padding: EdgeInsets.only(top: 25),
              child: Text("Kayıt Ol",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Tüm bilgileri eksiksiz doldurunuz",
                  textAlign: TextAlign.center),
            ),
            signUpForm(),
          ],
        ),
      ),
    );
  }
}

class signUpForm extends StatefulWidget {
  const signUpForm({Key? key}) : super(key: key);

  @override
  State<signUpForm> createState() => _signUpFormState();
}

class _signUpFormState extends State<signUpForm> {

  final firstname = TextEditingController();
  final lastname = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final checkPassword = TextEditingController();

  Future<void> AddToUser() async{
    bool isNotEmpty = firstname.text.isNotEmpty && lastname.text.isNotEmpty && email.text.isNotEmpty && password.text.isNotEmpty;
    if(password.text == checkPassword.text){
      if(isNotEmpty){
        var user = UsersDao().AddToUser(firstname.text,lastname.text,email.text,password.text);
        return user;
      }
      else{
        print("Tüm Bilgileri Doldurunuz.");
      }
    }
    else
      print("Parolalar Eşleşmiyor");
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Column(
            children: [
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
                    hintText: "Adınızı Giriniz",
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
                    suffixIcon:const Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Icon(Icons.drive_file_rename_outline),
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
                    labelText: "Soyadınız",
                    hintText: "Soyadınızı Giriniz",
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
                    suffixIcon:const Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Icon(Icons.drive_file_rename_outline),
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
                    labelText: "Email",
                    hintText: "Email Giriniz",
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
                    suffixIcon: const Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Icon(Icons.mail),
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
                    hintText: "Şifre Giriniz",
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
                    suffixIcon:const Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Icon(Icons.lock),
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
                  controller: checkPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.always,
                    labelText: "Şifre",
                    hintText: "Tekrar Şifre Giriniz",
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
                    suffixIcon:const Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Icon(Icons.lock),
                    ),
                  ),
                ),
              ),Padding(
                padding: EdgeInsets.only(top: 20),
                child: SizedBox(
                  width: double.infinity,
                  height: 53,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
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
                          AddToUser();
                          if(checkPassword.text == password.text && firstname.text.isNotEmpty && lastname.text.isNotEmpty && email.text.isNotEmpty && password.text.isNotEmpty){
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text("Kayıt Olma İşlemi Başarılı"),
                                content: const Text("Butonlara Tıklayarak İstediğiniz İşlemi Yapabilirsiniz."),
                                actions: [
                                  TextButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Geri Dön")
                                  ),
                                  TextButton(
                                      onPressed: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => LogIn()));
                                      },
                                      child: const Text("Giriş Yap")
                                  ),
                                ],
                              ),
                            );

                          }
                          else if(checkPassword.text != password.text){
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text("Kayıt Olma İşlemi Başarısız"),
                                content: const Text("Şifreler Eşleşmiyor."),
                                actions: [
                                  TextButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Geri Dön")
                                  ),
                                ],
                              ),
                            );

                          }
                          else if(firstname.text.isEmpty || lastname.text.isEmpty || email.text.isEmpty || password.text.isEmpty){
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text("Kayıt Olma İşlemi Başarısız"),
                                content: const Text("Tüm Bilgileri Eksiksiz Doldurunuz."),
                                actions: [
                                  TextButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Geri Dön")
                                  ),
                                ],
                              ),
                            );
                          }
                          else{
                            showDialog<String>(
                              context: context,
                              builder: (BuildContext context) => AlertDialog(
                                title: const Text("Kayıt Olma İşlemi Başarısız"),
                                actions: [
                                  TextButton(
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                      child: const Text("Geri Dön")
                                  ),
                                ],
                              ),
                            );
                          }
                        },
                        child: const Text("Kayıt Ol")),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
