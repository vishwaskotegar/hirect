import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'cart_screen.dart';
import 'product_class.dart';

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
      title: 'hirect',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> items = ["Groceries", "Fruits", "Friuts and vegitables"];
  FocusNode searchNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: (){
        searchNode.unfocus();
      },
      child: Scaffold(
        // backgroundColor: Color(0xFFE7E5FF),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFE7E5FF),
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.send,
                  color: Colors.black,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                color: const Color(0xFFE7E5FF),
                padding: const EdgeInsets.all(8),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.asset("images/Rectangle 368.png"),
                    ),
                    Container(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: w / 1.7,
                            child: Text(
                              "Chamundeshwari kirana store",
                              style: GoogleFonts.montserrat(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.radio_button_checked,
                                  color: Colors.green,
                                ),
                              ),
                              Text(
                                "Open",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              const Icon(
                                Icons.push_pin,
                                color: Colors.blue,
                              ),
                              Text(
                                "2.3Km",
                                style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              const Icon(
                                Icons.map_outlined,
                                color: Colors.blue,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 250,
                            height: 35,
                            child: ListView.builder(
                              itemCount: 3,
                              // itemExtent: 1,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Padding(
                                  padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Container(
                                    height: 35,
                                      padding: const EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                          border: Border.all(color: Colors.red),
                                          borderRadius: BorderRadius.circular(16)),
                                      child: Text(items[index])),
                                );
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Container(
                width: w,
                height: 70,
                decoration: const BoxDecoration(color: const Color(0xFFE7E5FF)),
                child: Center(
                  child: Container(
                    width: 80,
                    height: 30,
                    decoration: BoxDecoration(
                        color: const Color(0xFFFF5B5B),
                        borderRadius: BorderRadius.circular(10)),
                    // color: Color(0xFFFF5B5B),
                    child: const Center(child: Text("+Follow",style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,

                    ),)),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding:  EdgeInsets.only(left: w*0.23),
                        child: Container(
                          width: w*0.3,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            border: Border.all(color: Color(0xffD4D1FF),
                            ),
                          ),
                          child: Center(child: Text("ABOUT",style: TextStyle(
                            color: Color(0xff6A5BFF),
                            fontSize: 16
                          ),),),
                        ),
                      ),
                      Container(
                        width: w*0.3,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0xff6A5BFF),
                          border: Border.all(color: Color(0xffD4D1FF),
                          ),
                        ),
                        child: Center(child: Text("MENU",style: TextStyle(
                            color: Colors.white
                        ),),),
                      ),
                    ],
                  ),

                ],
              ),
              const SizedBox(height: 10,),
              SizedBox(
                width: w*0.9,
                child: TextFormField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search,color: Colors.grey,),
                      fillColor: Colors.white,
                      filled: true,
                      hintText: "Search for Products or Services",
                      hintStyle: TextStyle(
                        color: Color(0xff8E8E8E),
                      ),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              style: BorderStyle.none))),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  focusNode: searchNode,
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.only(bottom: 50,right: 10),
                child: SizedBox(
                  height: h*0.8,
                  width: w,
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),

                      itemCount: ProductDetails.productList.length,
                      itemBuilder: (context,index){
                        ProductDetails product = ProductDetails.productList[index];
                        return Row(
                          children: [
                            ClipRRect(
                              borderRadius:BorderRadius.circular(10),
                              child: Container(
                                width: w*0.35,
                                height: h*0.2,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(product.imageUrl.toString()),
                                    fit: BoxFit.contain,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                              child: Text(product.productName.toString(),style: GoogleFonts.montserrat(
                                fontSize: 12,
                                fontWeight: FontWeight.bold
                              ),),
                            ),
                            Column(
                              children: [
                                Text('Rs ${(product.price)!.toInt()}/kg',style: GoogleFonts.montserrat(
                                  fontSize: 13,
                                  color: Colors.black.withOpacity(0.8)
                                ),),
                                Text("Rs 40/kg",style: TextStyle(
                                  fontSize: 13,
                                  decoration: TextDecoration.lineThrough,
                                  color: Colors.black.withOpacity(0.5)
                                ),),
                                SizedBox(height: h*0.05,),

                                Container(
                                  width: w*0.2,
                                  height: 30,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Color(0xffFF5B5B),
                                    border: Border.all(color: Color(0xffD4D1FF),
                                    ),
                                  ),
                                  child: Center(child: Text("Add",style: TextStyle(
                                      color: Colors.white
                                  ),),),
                                )
                              ],
                            ),

                          ],
                        );
                      }),
                ),
              )
            ],
          ),
        ),
        bottomNavigationBar: buildPaymentButton(w, h, Theme.of(context)),

      ),
    );
  }
  Widget buildPaymentButton(double w, double h, ThemeData t) {
    final s = MediaQuery.of(context).textScaleFactor;
    return Container(
      width: w,
      height: h*0.075,
      decoration: const BoxDecoration(
          color: Color(0xff6A5BFF)
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Rs ${ProductDetails.getSubTotal()} | ${ProductDetails.productList.length} items",style: TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold
            ),),
            Row(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CartScreen()));
                  },
                  child: Text("View cart",style: GoogleFonts.montserrat(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold
                  ),),
                ),
                Icon(Icons.chevron_right,color: Colors.white,),

              ],
            ),
          ],
        ),
      ),
    );
  }

}