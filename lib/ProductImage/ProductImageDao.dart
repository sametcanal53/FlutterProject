import 'package:mobile_project/Helper/dbHelper.dart';
import 'package:mobile_project/ProductImage/ProductImage.dart';

class ProductImageDao{

  Future<List<ProductImage>> getProductImage() async{
    var db = await dbHelper.dbAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("Select * from Image");
    return List.generate(maps.length, (i){
      var row = maps[i];
      return ProductImage(row["product_image_id"], row["product_image_1"], row["product_image_2"], row["product_image_3"], row["product_image_4"]);
    }
    );
  }
}