import 'package:mobile_project/Category/Categories.dart';
import 'package:mobile_project/ProductImage/ProductImage.dart';

class Products{

  late int product_id;
  late String product_name;
  late String product_description;
  late int product_price;
  late ProductImage productImage;
  late Categories category;

  Products(this.product_id,this.product_name,this.product_description,this.product_price,this.productImage,this.category);
  
}