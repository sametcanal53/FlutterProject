import 'package:mobile_project/Category/Categories.dart';
import 'package:mobile_project/Helper/dbHelper.dart';
import 'package:mobile_project/ProductImage/ProductImage.dart';
import 'package:mobile_project/Products/Products.dart';

class ProductsDao{
  Future<List<Products>> getProducts() async{
    var db = await dbHelper.dbAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM Products,Categories,Product_Image Where Products.category_id = Categories.category_id and products.product_image_id = Product_Image.product_image_id");

    return List.generate(maps.length,(i){
      var row = maps[i];
      var productImage = ProductImage(row["product_image_id"], row["product_image_1"], row["product_image_2"], row["product_image_3"],row["product_image_4"]);
      var category = Categories(row["category_id"], row["category_name"]);
      var product = Products(row["product_id"],row["product_name"], row["product_description"], row["product_price"],productImage,category);
      return product;
    }
    );
  }

  Future<List<Products>> getByCategoryName(int category_id) async{
    var db = await dbHelper.dbAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM Products,Categories,Product_Image Where Products.category_id = Categories.category_id and products.product_image_id = Product_Image.product_image_id and products.category_id = ${category_id}");
    return List.generate(maps.length,(i){
      var row = maps[i];
      var productImage = ProductImage(row["product_image_id"], row["product_image_1"], row["product_image_2"], row["product_image_3"],row["product_image_4"]);
      var category = Categories(row["category_id"], row["category_name"]);
      var product = Products(row["product_id"],row["product_name"], row["product_description"], row["product_price"],productImage,category);
      return product;
    });
  }

  Future<List<Products>> getProduct(int product_id) async{
    var db = await dbHelper.dbAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM Products,Categories,Product_Image Where Products.category_id = Categories.category_id and products.product_image_id = Product_Image.product_image_id and products.product_id = ${product_id}");
    return List.generate(maps.length,(i){
      var row = maps[i];
      var productImage = ProductImage(row["product_image_id"], row["product_image_1"], row["product_image_2"], row["product_image_3"],row["product_image_4"]);
      var category = Categories(row["category_id"], row["category_name"]);
      var product = Products(row["product_id"],row["product_name"], row["product_description"], row["product_price"],productImage,category);
      return product;
    });
  }

  Future<List<Products>> getPopular() async{
    var db = await dbHelper.dbAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM Products,Categories,Product_Image Where Products.category_id = Categories.category_id and products.product_image_id = Product_Image.product_image_id and product_id IN (1,2,5,9,12,19,22)");

    return List.generate(maps.length,(i){
      var row = maps[i];
      var productImage = ProductImage(row["product_image_id"], row["product_image_1"], row["product_image_2"], row["product_image_3"],row["product_image_4"]);
      var category = Categories(row["category_id"], row["category_name"]);
      var product = Products(row["product_id"],row["product_name"], row["product_description"], row["product_price"],productImage,category);
      return product;
    }
    );
  }



  Future<List<Products>> getCartItem() async{
    var db = await dbHelper.dbAccess();
    List<Map<String,dynamic>> maps = await db.rawQuery("SELECT * FROM Products,Categories,Product_Image Where Products.category_id = Categories.category_id and products.product_image_id = Product_Image.product_image_id and product_id IN (1,2,4,7,9,11,12,14,16,18,19)");

    return List.generate(maps.length,(i){
      var row = maps[i];
      var productImage = ProductImage(row["product_image_id"], row["product_image_1"], row["product_image_2"], row["product_image_3"],row["product_image_4"]);
      var category = Categories(row["category_id"], row["category_name"]);
      var product = Products(row["product_id"],row["product_name"], row["product_description"], row["product_price"],productImage,category);
      return product;
    }
    );
  }

}