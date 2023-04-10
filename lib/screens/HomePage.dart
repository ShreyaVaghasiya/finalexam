import 'dart:async';

import 'package:finalexam/Utils/AppUtil.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    Timer(Duration(seconds: 30), () => AppUtil.stockList.clear());
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green.shade900,
        leading: Icon(
          CupertinoIcons.line_horizontal_3_decrease,
          size: 25,
          color: CupertinoColors.white,
        ),
        title: Text(
          "Products",
          style: GoogleFonts.lato(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: CupertinoColors.white,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(CupertinoIcons.cart)),
        ],
      ),
      body: ListView(
        children: List.generate(
          AppUtil.stockList.length,
          (index) => Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {},
              child: ListTile(
                leading: Text(
                  "${AppUtil.stockList[index]['id']}",
                  style: GoogleFonts.robotoSlab(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "${AppUtil.stockList[index]['name']}",
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                            color: CupertinoColors.black,
                          ),
                        ),
                        Text(
                          "${AppUtil.stockList[index]['subname']}",
                          style: GoogleFonts.poppins(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: CupertinoColors.black,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              if (AppUtil.stockList[index]['cart'] == false) {
                                AppUtil.adCart++;
                              }
                              AppUtil.stockList[index].add(AppUtil.cartList);
                            });
                          },
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Colors.black,
                            child: Center(
                              child: Icon(
                                CupertinoIcons.add,
                                size: 20,
                                color: CupertinoColors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text("${AppUtil.adCart}"),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          radius: 15,
                          backgroundColor: Colors.black,
                          child: Center(
                            child: Icon(
                              CupertinoIcons.minus,
                              size: 20,
                              color: CupertinoColors.white,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
