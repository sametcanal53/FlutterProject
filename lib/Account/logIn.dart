import 'package:flutter/material.dart';
import 'package:mobile_project/Account/logInSuccess.dart';
import 'package:mobile_project/Account/signUp.dart';
import 'package:mobile_project/Users/Users.dart';
import 'package:mobile_project/Users/UsersDao.dart';
import 'package:mobile_project/main.dart';

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text("Giriş Yap",style: TextStyle(color: Colors.black)),
      ),
      body: const Body(),
    );
  }
}

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
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
              child: Text("Giriş Yap",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 35,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text("Giriş yapmak için email ve şifrenizi giriniz.",
                  textAlign: TextAlign.center),
            ),
            LogInForm(),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: SignUpButton(),
            )
          ],
        ),
      ),
    );
  }
}

class LogInForm extends StatefulWidget {
  const LogInForm({Key? key}) : super(key: key);

  @override
  State<LogInForm> createState() => _LogInFormState();
}

class _LogInFormState extends State<LogInForm> {
  final email = TextEditingController();
  final password = TextEditingController();

  Future<List<Users>> LoginValidation() async {
    bool isNotEmpty = email.text.isNotEmpty && password.text.isNotEmpty;

    if (isNotEmpty) {
      var user = await UsersDao().Validate(email.text, password.text);
      if(user.isNotEmpty){
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text("Giriş İşlemi Başarılı"),
            content: const Text("İstediğiniz İşlemi Seçiniz"),
            actions: [
              TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                  },
                  child: const Text("Anasayfa")
              ),
              TextButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LogInSuccess(user: user[0])));
                  },
                  child: const Text("Hesabım")
              ),
            ],
          ),
        );
      }else{
        showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text("Giriş İşlemi Başarısız"),
            content: const Text("Email veya Şifre Hatalı."),
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
      return user;
    }
    else {
      showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: const Text("Giriş İşlemi Başarısız"),
          content: const Text("Lütfen Giriş Yapabilmek İçin Eksiksiz Doldurunuz."),
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
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 35
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
            padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 0
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
            padding: const EdgeInsets.only(top:25.0),
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
                      LoginValidation();
                    },
                    child: const Text("Giriş Yap")),
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SignUpButton extends StatefulWidget {
  const SignUpButton({Key? key}) : super(key: key);

  @override
  State<SignUpButton> createState() => _SignUpButtonState();
}

class _SignUpButtonState extends State<SignUpButton> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Hesabınız Yok Mu?"),
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.white),
            elevation: MaterialStateProperty.all(0),
          ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
          },
          child: Text("Hesap Oluştur",style: TextStyle(color: Colors.cyan)),
        ),
      ],
    );
  }
}
