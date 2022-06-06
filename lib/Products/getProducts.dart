import 'package:flutter/material.dart';
import 'package:mobile_project/Products/ProductDetail.dart';
import 'package:mobile_project/Products/Products.dart';
import 'package:mobile_project/Products/ProductsDao.dart';

class getProducts extends StatefulWidget {
  const getProducts({Key? key}) : super(key: key);

  @override
  State<getProducts> createState() => _getProductsState();
}

class _getProductsState extends State<getProducts> {

  Future<List<Products>> getAllProducts() async{
    var products = await ProductsDao().getProducts();
    return products;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text("Tüm Ürünler",style: TextStyle(color: Colors.black)),
      ),
      body: FutureBuilder<List<Products>>(
        future: getAllProducts(),
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
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail(product: product)));
                  },
                  child: Card(
                    child: Row(
                      children: [
                        Image.asset("images/${product.productImage.product_image_1}",width: 155),
                        SizedBox(
                          height: 250,
                          width: MediaQuery.of(context).size.width * 0.55,
                          child: Padding(
                              padding: EdgeInsets.only(top:18,left: 15),
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(product.product_name,style: TextStyle(fontWeight: FontWeight.bold)),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(product.product_description),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("₺${product.product_price.toString()}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
                                  ),
                                ],
                              )
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
    );
  }
}
