import 'package:flutter/material.dart';
import 'package:mobile_project/Category/Categories.dart';
import 'package:mobile_project/Category/CategoriesDao.dart';
import 'package:mobile_project/Category/CategoryDetail.dart';

class getCategories extends StatefulWidget {
  const getCategories({Key? key}) : super(key: key);

  @override
  State<getCategories> createState() => _getCategoriesState();
}

class _getCategoriesState extends State<getCategories> {

  Future<List<Categories>> getAllCategories() async{
    var categories = await CategoriesDao().getCategories();
    return categories;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: Text("Tüm Kategoriler",style: TextStyle(color: Colors.black)),
      ),
      body: FutureBuilder<List<Categories>>(
        future: getAllCategories(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            var categories = snapshot.data;
            return ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: categories!.length,
              itemBuilder: (context,index){
                var category = categories[index];
                return GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CategoryDetail(category: category)));
                  },
                  child: Card(
                    child: SizedBox(
                      height: 85,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(category.category_name,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold)),
                        ],
                      ),
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
