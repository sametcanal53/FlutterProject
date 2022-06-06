import 'package:mobile_project/Helper/dbHelper.dart';
import 'package:mobile_project/Users/Users.dart';

class UsersDao{

  Future<List<Users>> getUsers() async{
    var db = await dbHelper.dbAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("Select * from Users");
    return List.generate(maps.length, (i){
      var row = maps[i];
      return Users(row["user_id"], row["user_firstname"], row["user_lastname"], row["user_username"], row["user_email"], row["user_password"]);
    });
  }



  Future<void> AddToUser(String user_firstname,String user_lastname,String user_email,String user_password) async{
    var db = await dbHelper.dbAccess();
    var info = Map<String,dynamic>();{
      info["user_firstname"] = user_firstname;
      info["user_lastname"] = user_lastname;
      info["user_username"] = user_firstname + user_lastname;
      info["user_email"] = user_email;
      info["user_password"] = user_password;

      await db.insert("Users", info);
    }
  }

  Future<void> UpdateToUser(int user_id,String user_firstname,String user_lastname,String user_username,String user_email,String user_password) async{
    var db = await dbHelper.dbAccess();
    var info = Map<String,dynamic>();
    if(!user_firstname.isEmpty){
      info["user_firstname"] = user_firstname;
    }
    if(!user_lastname.isEmpty){
      info["user_lastname"] = user_lastname;
    }
    if(!user_username.isEmpty){
      info["user_username"] = user_username;
    }
    if(!user_email.isEmpty){
      info["user_email"] = user_email;
    }
    if(!user_password.isEmpty){
      info["user_password"] = user_password;
    }
    else{
      return null;
    }

    await db.update("Users", info,where: "user_id=?",whereArgs: [user_id]);
  }

  Future<void> DeleteToUser(int user_id) async{
    var db = await dbHelper.dbAccess();
    await db.delete("Users",where:"user_id=?",whereArgs: [user_id]);
  }

  Future<List<Users>> Validate(String user_email,String user_password) async{
    var db = await dbHelper.dbAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM Users WHERE users.user_email == '${user_email}' and users.user_password == '${user_password}'");
    if(maps.length>0){
      return List.generate(maps.length, (i){
        var row = maps[0];
        return Users(row["user_id"], row["user_firstname"], row["user_lastname"], row["user_username"], row["user_email"], row["user_password"]);
      });
    }
    else{
      return [];
    }

  }

}