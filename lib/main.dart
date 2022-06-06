import 'package:flutter/material.dart';
import 'package:mobile_project/Account/logOutSuccess.dart';
import 'package:mobile_project/Category/Categories.dart';
import 'package:mobile_project/Category/CategoriesDao.dart';
import 'package:mobile_project/Category/CategoryDetail.dart';
import 'package:mobile_project/Category/getCategories.dart';
import 'package:mobile_project/Order/Cart.dart';
import 'package:mobile_project/Products/ProductDetail.dart';
import 'package:mobile_project/Products/Products.dart';
import 'package:mobile_project/Products/ProductsDao.dart';
import 'package:mobile_project/Products/getProducts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context){
    return const Scaffold(
      body: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children:[
            Header(),
            SaleBanner(),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
                top: 25
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("İlgilendiğiniz Kategoriler",
                    style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)
                  ),
                  MoreProduct(),
                ],
              ),
            ),
            Special(),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 5
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("Bu Ayın Popüler Ürünleri",
                      style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)
                  ),
                  MoreProduct(),
                ],
              ),
            ),
            Populer(),
          ],
        ),
      ),
    );
  }

}


class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {

  Future<List<Products>> getAllProducts() async{
    var products = await ProductsDao().getProducts();
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
          top: 50,
          left: 20,
          right: 20,
          bottom: 20
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>getCategories()));
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 60,
                      vertical: 15
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(25)
                  ),
                  child: Text("Tüm Kategoriler",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 18)),
                ),
              )
            ],
          ),

          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Cart()));
                },
                child: Icon(Icons.shopping_cart_outlined, color: Colors.black),
                style: ButtonStyle(
                  minimumSize:MaterialStateProperty.all(Size(0,0)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                  ),
                ),
              ),

            ],
          ),
          Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>LogOutSuccess()));
                },
                child: Icon(Icons.account_circle_outlined, color: Colors.black),
                style: ButtonStyle(
                  minimumSize:MaterialStateProperty.all(Size(0,0)),
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  elevation: MaterialStateProperty.all(0),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
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

class SaleBanner extends StatefulWidget {
  const SaleBanner({Key? key}) : super(key: key);

  @override
  State<SaleBanner> createState() => _SaleBannerState();
}

class _SaleBannerState extends State<SaleBanner> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
          horizontal: 20
      ),
      padding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 15
      ),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.cyan,
          borderRadius: BorderRadius.circular(25)
      ),
      child: const Text.rich(
        TextSpan(
            text: "Büyük Yaz İndirimi\n\n",
            style: TextStyle(color: Colors.white,fontSize:24,fontWeight: FontWeight.bold),
            children: [
              TextSpan(
                text: "1 Haziran - 14 Haziran Tarihleri Arasında Sepette 25% İndirim\n",
                style:TextStyle(fontSize:18,fontWeight: FontWeight.bold),
              ),
            ]
        ),
      ),
    );
  }
}

class Special extends StatefulWidget {
  const Special({Key? key}) : super(key: key);

  @override
  State<Special> createState() => _SpecialState();
}

class _SpecialState extends State<Special> {

  Future<List<Categories>> getSpecial() async{
    var categories = await CategoriesDao().getSpecial();
    return categories;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            height: 160,
            width: 490,
            child : FutureBuilder<List<Categories>>(
              future: getSpecial(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  var categories = snapshot.data;
                  return GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: categories!.length,
                    ),
                    itemCount: categories.length,
                    itemBuilder: (context,index){
                      var category = categories[index];
                      return Column(
                        children: [
                          ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryDetail(category: category)));
                            },
                            child: Image(
                              width: 150,
                              height: 100,
                              image: AssetImage("images/${category.category_name}.jpg"),
                            ),
                            style: ButtonStyle(
                              minimumSize:MaterialStateProperty.all(Size(0,0)),
                              backgroundColor: MaterialStateProperty.all(Colors.white),
                              elevation: MaterialStateProperty.all(0),
                              shape: MaterialStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                ),
                              ),
                            ),
                          ),
                          Text("${category.category_name}",
                            style: TextStyle(color: Colors.black))
                        ],
                      );
                    },
                  );
                }else{
                  return Center();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class Populer extends StatefulWidget {
  const Populer({Key? key}) : super(key: key);

  @override
  State<Populer> createState() => _PopulerState();
}

class _PopulerState extends State<Populer> {

  Future<List<Products>> getPopular() async{
    var products = await ProductsDao().getPopular();
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          SizedBox(
            height: 180,
            width: 1000,
            child : FutureBuilder<List<Products>>(
              future: getPopular(),
              builder: (context,snapshot){
                if(snapshot.hasData){
                  var products = snapshot.data;
                  return GridView.builder(
                    scrollDirection: Axis.vertical,
                    gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: products!.length,
                    ),
                    itemCount: products.length,
                    itemBuilder: (context,index){
                      var product = products[index];
                      return Column(
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ProductDetail(product: product)));
                              },
                              child: Image(
                                width: 150,
                                height: 100,
                                image: AssetImage("images/${product.productImage.product_image_1}"),
                              ),
                              style: ButtonStyle(
                                minimumSize:MaterialStateProperty.all(Size(0,0)),
                                backgroundColor: MaterialStateProperty.all(Colors.white),
                                elevation: MaterialStateProperty.all(0),
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(50),
                                  ),
                                ),
                              ),
                            ),
                            Text("${product.product_name} ${product.product_description.substring(0,12)}",
                              style: TextStyle(color: Colors.black),)
                          ],
                      );
                    },
                  );
                }else{
                  return Center();
                }
              },
            ),
          )
        ],
      ),
    );
  }
}

class MoreProduct extends StatefulWidget {
  const MoreProduct({Key? key}) : super(key: key);

  @override
  State<MoreProduct> createState() => _MoreProductState();
}

class _MoreProductState extends State<MoreProduct> {

  Future<List<Products>> getAllProducts() async{
    var products = await ProductsDao().getProducts();
    return products;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => getProducts()));
      },
      child: Text("Daha Fazlası",style: TextStyle(fontStyle: FontStyle.italic)),
    );
  }
}
