import 'package:flutter/material.dart';
import 'package:mobile_project/Order/CheckOut.dart';
import 'package:mobile_project/Products/ProductDetail.dart';
import 'package:mobile_project/Products/Products.dart';
import 'package:mobile_project/Products/ProductsDao.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sepetim",style: TextStyle(color: Colors.black)),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: CartSummary(),
    );
  }
}

class CartSummary extends StatefulWidget {

  @override
  State<CartSummary> createState() => _CartSummaryState();
}

class _CartSummaryState extends State<CartSummary> {

  var total = 0;
  Future<List<Products>> getCartItem()  async{
    var products =await ProductsDao().getCartItem();
    total = 0;
    for(var product in products){
      total += product.product_price;
    }
    return products;
  }

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(
                  height:(MediaQuery.of(context).size.height)-160,
                  width: MediaQuery.of(context).size.width,
                  child : FutureBuilder<List<Products>>(
                    future: getCartItem(),
                    builder: (context,snapshot){
                      if(snapshot.hasData){
                        var products = snapshot.data;
                        return ListView.builder(
                          scrollDirection: Axis.vertical,
                          itemCount: products!.length,
                          itemBuilder: (context,index){
                            var product = products[index];
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetail(product: product)));
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 15,
                                    top:5,
                                    bottom: 25
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      width: 88,
                                      child: AspectRatio(
                                        aspectRatio: 0.88,
                                        child: Container(
                                          child: Image.asset("images/${product.productImage.product_image_1}"),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Container(
                                      width: MediaQuery.of(context).size.width-130,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children:[
                                          Text( product.product_name +" "+product.product_description,
                                            style: TextStyle(color: Colors.black, fontSize: 16),
                                          ),
                                          SizedBox(height: 10),
                                          Text.rich(
                                            TextSpan(
                                              text: "₺ ${product.product_price.toString()}",
                                              style: TextStyle(
                                                  color: Colors.cyan),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      }else{
                        return Center();
                      }
                    },
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 30,
                  ),
                  // height: 174,
                  child: SafeArea(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(),
                            SizedBox(
                              height: 55,
                              width: 200,
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.cyan),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(50),
                                      )
                                  ),
                                ),
                                child: Text("Devam Et"),
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => CheckOut(price:total )));
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
