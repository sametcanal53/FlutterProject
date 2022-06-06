import 'package:flutter/material.dart';
import 'package:number_display/number_display.dart';

class CheckOut extends StatefulWidget {
  int price;
  CheckOut({required this.price});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {

  final value = createDisplay(
    length: 20,
    decimal: 5
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              width: 300,
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white70
              ),
              child: Column(
                  children: [
                    Text("Toplam Tutar",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 24)),
                    Divider(),
                    Text("₺ ${value((widget.price*.65))}",style: TextStyle(fontSize: 30,fontStyle: FontStyle.italic)),
                  ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Container(
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
                      style: TextStyle(color: Colors.white,fontSize:24,fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: "1 Haziran - 14 Haziran Tarihleri Arasında Sepette 25% İndirim\n",
                          style:TextStyle(fontSize:18,fontWeight: FontWeight.bold),
                        ),
                      ]
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:10.0),
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 20
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(25)
                ),
                child: const Text.rich(
                  TextSpan(
                      style: TextStyle(color: Colors.white,fontSize:24,fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: "Şimdi Alışverişin Tam Zamanı Kargo Bedava*\n\n",
                          style:TextStyle(fontSize:18,fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "*1000 TL Üzeri Alışverişleriniz İçin Geçerlidir\n",
                          style:TextStyle(fontSize:14,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
                        ),

                      ]
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top:15.0),
              child: Container(
                margin: const EdgeInsets.symmetric(
                    horizontal: 20
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 15
                ),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(25)
                ),
                child: const Text.rich(
                  TextSpan(
                      style: TextStyle(color: Colors.white,fontSize:24,fontWeight: FontWeight.bold),
                      children: [
                        TextSpan(
                          text: "Uygulama Üzerinden Yaptığınız İlk Alışverişe Özel 10% İndirim**\n\n",
                          style:TextStyle(fontSize:18,fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: "**Sadece İlk Siparişiniz İçin Geçerlidir\n",
                          style:TextStyle(fontSize:14,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
                        ),
                      ]
                  ),
                ),
              ),
            ),
              Padding(
                padding: const EdgeInsets.only(top:18.0),
                child: DataTable(
                  columns:[
                    DataColumn(label: Text("Detay")),
                    DataColumn(label: Text("Tutar")),
                ],
                  rows: [
                    DataRow(
                      cells: [
                        DataCell(Text("Toplam Alışveriş Tutarı")),
                        DataCell(Text("₺${value(widget.price)}")),
                    ]),
                    DataRow(
                        cells: [
                          DataCell(Text("Sepette 25% İndirim")),
                          DataCell(Text("- ₺${value((widget.price*0.25))}")),
                        ]),
                    DataRow(
                        cells: [
                          DataCell(Text("Kargo Ücreti")),
                          DataCell(Text("+ ₺100")),
                        ]),
                    DataRow(
                        cells: [
                          DataCell(Text("1000TL Üzeri Kargo Ücretsiz")),
                          DataCell(Text("- ₺100")),
                        ]),
                    DataRow(
                        cells: [
                          DataCell(Text("İlk Alışverişe Özel 10% İndirim")),
                          DataCell(Text("- ₺${value((widget.price*0.1))}")),
                        ]),
                    DataRow(
                        cells: [
                          DataCell(Text("")),
                          DataCell(Text("₺${value((widget.price*.65))}",style: TextStyle(fontWeight: FontWeight.bold))),
                        ]),
                  ],
                ),
              ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
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
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.cyan),
                        shape: MaterialStateProperty.all(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50),
                            )
                        ),
                      ),
                      child: Text("Sepeti Onayla (₺${value((widget.price*.65))})"),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
