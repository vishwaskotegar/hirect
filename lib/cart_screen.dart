import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'product_class.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  bool deliveryMode = false;

  @override
  Widget build(BuildContext context) {
    final w = MediaQuery.of(context).size.width;
    final h = MediaQuery.of(context).size.height;
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      child: const Icon(
                        Icons.chevron_left,
                        color: Colors.black,
                        size: 30,
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Chamundeshwari Kirana Store",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: h * 0.02,
                    ),
                    Text(
                      "Cart items",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: h * 0.03,
                    ),
                    SizedBox(
                      width: w,
                      height: h * 0.27,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: ProductDetails.productList.length,
                          itemBuilder: (context, index) {
                            ProductDetails product =
                                ProductDetails.productList[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 25.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: 35,
                                    width: w * 0.4,
                                    child: Text(
                                      product.productName.toString(),
                                      style: GoogleFonts.montserrat(
                                        fontSize: 15,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 35,
                                    width: w * 0.2,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        InkWell(
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                color: const Color(0xffFF5B5B),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: const Center(
                                                child: Text(
                                              "-",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 24),
                                            )),
                                          ),
                                          onTap: () {
                                            if (product.quantity! > 0) {
                                              setState(() {
                                                product.quantity =
                                                    product.quantity! - 1;
                                              });
                                            }
                                          },
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        Container(
                                          width: 20,
                                          height: 20,
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: Colors.grey
                                                      .withOpacity(0.8))),
                                          child: Center(
                                            child: Text(
                                                product.quantity.toString(),
                                                style: GoogleFonts.montserrat(
                                                    fontSize: 13,
                                                    fontWeight:
                                                        FontWeight.bold)),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 3,
                                        ),
                                        InkWell(
                                          child: Container(
                                            width: 20,
                                            height: 20,
                                            decoration: BoxDecoration(
                                                color: const Color(0xffFF5B5B),
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            child: const Center(
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              product.quantity =
                                                  product.quantity! + 1;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 35,
                                    width: w * 0.2,
                                    child: Text(
                                        "Rs ${product.price! * product.quantity!}",
                                        style: GoogleFonts.montserrat(
                                            fontSize: 15,
                                            color: const Color(0xff6C6C6C))),
                                  )
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 1,
                color: Color(0xff6C6C6C),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                width: w,
                height: h * 0.15,
                decoration: const BoxDecoration(
                  color: Color(0xffE7E5FF),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Choose Delivery mode",
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                deliveryMode = !deliveryMode;
                              });
                              print("Delivery mode :$deliveryMode");
                            },
                            child: Container(
                              width: w * 0.3,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: deliveryMode == false
                                      ? Color(0xff6A5BFF)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(5),
                                  border: deliveryMode == false
                                      ? null
                                      : Border.all(
                                          color: const Color(0xff6A5BFF))),
                              child: Center(
                                  child: Text(
                                "Go to Shop",
                                style: GoogleFonts.montserrat(
                                    fontSize: 17,
                                    color: deliveryMode == false
                                        ? Colors.white
                                        : const Color(0xff6A5BFF)),
                              )),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                deliveryMode = !deliveryMode;
                              });
                              print("Delivery mode :$deliveryMode");
                            },
                            child: Container(
                              width: w * 0.3,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: deliveryMode == true
                                      ? const Color(0xff6A5BFF)
                                      : Colors.transparent,
                                  borderRadius: BorderRadius.circular(5),
                                  border: deliveryMode == true
                                      ? null
                                      : Border.all(color: Color(0xff6A5BFF))),
                              child: Center(
                                  child: Text(
                                "Delivery",
                                style: GoogleFonts.montserrat(
                                    fontSize: 17,
                                    color: deliveryMode == true
                                        ? Colors.white
                                        : Color(0xff6A5BFF)),
                              )),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Detailed Bill",
                        style: GoogleFonts.montserrat(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sub Total",
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                            )),
                        Text("Rs ${ProductDetails.getSubTotal()}")
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("GST",
                            style: GoogleFonts.montserrat(
                              fontSize: 16,
                            )),
                        Text(
                            "Rs ${(ProductDetails.getSubTotal() * 0.18).toStringAsFixed(2)}"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Grand Total",
                            style: GoogleFonts.montserrat(
                                fontSize: 16, fontWeight: FontWeight.bold)),
                        Text(
                          "Rs ${getGST()}",
                          style: GoogleFonts.montserrat(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      resizeToAvoidBottomInset: true,
      bottomNavigationBar: bottomNavBar(w, h, Theme.of(context), deliveryMode),
    );
  }

  Widget bottomNavBar(double w, double h, ThemeData t, bool deliveryMode) {
    final s = MediaQuery.of(context).textScaleFactor;
    if (deliveryMode == false) {
      return Container(
        width: w,
        height: h * 0.075,
        decoration: const BoxDecoration(color: Colors.white),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: w * 0.4,
              height: h * 0.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [Icon(Icons.money), Text("Cash on Delivery")],
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: Color(0xff007E05)),
              width: w * 0.6,
              height: h * 0.1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "Checkout",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                  ),
                ],
              ),
            )
          ],
        ),
      );
    } else {
      return Container(
        width: w,
        height: h * 0.17,
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Container(
              width: w,
              height: h * 0.07,
              decoration: BoxDecoration(
                color: Color(0xff6A5BFF),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Shipping address",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        Text(
                          "#43, 3rd Cross, Sahankar Nagar road, Sajat",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: w * 0.2,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Color(0xffFF5B5B),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                        child: Text(
                          "Change",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  width: w * 0.4,
                  height: h * 0.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Icon(Icons.money),
                      Text("Cash on Delivery")
                    ],
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(color: Color(0xff007E05)),
                  width: w * 0.6,
                  height: h * 0.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(
                        "Checkout",
                        style: GoogleFonts.montserrat(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.normal),
                      ),
                      Icon(
                        Icons.chevron_right,
                        color: Colors.white,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }
  }

  String getGST() {
    String a =
        (ProductDetails.getSubTotal() + (ProductDetails.getSubTotal() * 0.18))
            .toStringAsFixed(2);
    return a;
  }
}
