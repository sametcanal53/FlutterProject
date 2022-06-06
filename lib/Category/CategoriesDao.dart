import 'package:mobile_project/Category/Categories.dart';
import 'package:mobile_project/Helper/dbHelper.dart';

class CategoriesDao{

  Future<List<Categories>> getCategories() async{
    var db = await dbHelper.dbAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("Select * from Categories");
    return List.generate(maps.length, (i){
      var row = maps[i];
      return Categories(row["category_id"], row["category_name"]);
    }
    );
  }

  Future<List<Categories>> getSpecial() async{
    var db = await dbHelper.dbAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("Select * from Categories where category_id IN (2,1,3)");
    return List.generate(maps.length, (i){
      var row = maps[i];
      return Categories(row["category_id"], row["category_name"]);
    }
    );
  }
}