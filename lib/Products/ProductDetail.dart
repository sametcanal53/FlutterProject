import 'package:flutter/material.dart';
import 'package:mobile_project/Order/Cart.dart';
import 'package:mobile_project/Products/Products.dart';
import 'package:mobile_project/Products/ProductsDao.dart';

class ProductDetail extends StatefulWidget {
  Products product;
  ProductDetail({required this.product});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  Future<List<Products>> getProduct(product_id) async{
    var products = await ProductsDao().getProduct(product_id);
    return products;
  }

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text(widget.product.product_name,style: TextStyle(color: Colors.black)),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            SizedBox(
              width: double.infinity,
              height: 200,
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset("images/product_image_${widget.product.product_id}.${selectedIndex+1}.jpg"),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ...List.generate(4, (index) => preview(index))
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: double.infinity,
              height: 195,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  border: Border.all(color: Colors.black)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:[
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
                    child: Text(
                      widget.product.product_name,
                      style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 20,right: 45),
                    child: Text(widget.product.product_description),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
              child: Text(
                "₺ ${widget.product.product_price.toString()}",
                style: TextStyle(fontSize:20,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),
              ),
            ),

          ],
        ),
      ),
      bottomNavigationBar: SizedBox(
        width: double.infinity,
        height: 85,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 20),
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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
              },
              child: const Text("Sepete Ekle")),
        ),
      ),
    );
  }

  GestureDetector preview(int index){
    return GestureDetector(
      onTap: (){
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        margin: EdgeInsets.only(right: 15),
        padding: EdgeInsets.all(8),
        height: 48,
        width: 48,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
              color: selectedIndex == index ? Colors.cyan : Colors.white
          ),
        ),
        child: Image.asset("images/product_image_${widget.product.product_id}.${index+1}.jpg"),
      ),
    );
  }

}
