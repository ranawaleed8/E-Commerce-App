import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:reval/categores/cat.dart';
import 'package:reval/home.dart';
import 'package:reval/widget/imgbot.dart';
import 'package:reval/widget/texxt.dart';

class CategoryItem {
  final String title;
  final String imagePath;
  final Widget page;

  CategoryItem({
    required this.title,
    required this.imagePath,
    required this.page,
  });
}

class Viewall extends StatefulWidget {
  const Viewall({super.key});

  @override
  State<Viewall> createState() => _ViewallState();
}

class _ViewallState extends State<Viewall> {
  TextEditingController searchController = TextEditingController();
  List<CategoryItem> allItems = [];
  List<CategoryItem> filteredItems = [];

  @override
  void initState() {
    super.initState();
    allItems = [
      CategoryItem(
        title: 'Formal',
        imagePath: 'images/girl3.jpg',
        page: ShoppingScreen(
          categoryName: 'Formal',
          products: [
            Product(
              imagePath: 'images/girl1.jpg',
              name: 'Short dress',
              price: 70,
              page: Home(),
            ),
            Product(
              imagePath: 'images/girl1.jpg',
              name: 'Short dress',
              price: 100,
              page: Home(),
            ),
          ],
        ),
      ),
      CategoryItem(
        title: 'Dresses',
        imagePath: 'images/girl3.jpg',
        page: ShoppingScreen(
          categoryName: 'Dresses',
          products: [
            Product(
              imagePath: 'images/girl1.jpg',
              name: 'Short dress',
              price: 70,
              page: Home(),
            ),
            Product(
              imagePath: 'images/girl1.jpg',
              name: 'Short dress',
              price: 100,
              page: Home(),
            ),
          ],
        ),
      ),
      CategoryItem(
        title: 'Jeans',
        imagePath: 'images/girl3.jpg',
        page: ShoppingScreen(
          categoryName: 'Dresses',
          products: [
            Product(
              imagePath: 'images/girl1.jpg',
              name: 'Short dress',
              price: 70,
              page: Home(),
            ),
            Product(
              imagePath: 'images/girl1.jpg',
              name: 'Short dress',
              price: 100,
              page: Home(),
            ),
          ],
        ),
      ),
      CategoryItem(
        title: 'Tops',
        imagePath: 'images/girl3.jpg',
        page: ShoppingScreen(
          categoryName: 'Dresses',
          products: [
            Product(
              imagePath: 'images/girl1.jpg',
              name: 'Short dress',
              price: 70,
              page: Home(),
            ),
            Product(
              imagePath: 'images/girl1.jpg',
              name: 'Short dress',
              price: 100,
              page: Home(),
            ),
          ],
        ),
      ),
      CategoryItem(
        title: 'Bottoms',
        imagePath: 'images/girl3.jpg',
        page: ShoppingScreen(
          categoryName: 'Dresses',
          products: [
            Product(
              imagePath: 'images/girl1.jpg',
              name: 'Short dress',
              price: 70,
              page: Home(),
            ),
            Product(
              imagePath: 'images/girl1.jpg',
              name: 'Short dress',
              price: 100,
              page: Home(),
            ),
          ],
        ),
      ),
      CategoryItem(
        title: 'Co-ords',
        imagePath: 'images/girl3.jpg',
        page: Home(),
      ),
      CategoryItem(title: 'Denim', imagePath: 'images/girl3.jpg', page: Home()),
      CategoryItem(
        title: 'Jumpsuits',
        imagePath: 'images/girl3.jpg',
        page: Home(),
      ),
      CategoryItem(
        title: 'Sweaters',
        imagePath: 'images/girl3.jpg',
        page: Home(),
      ),
      CategoryItem(
        title: 'Sweatshirts',
        imagePath: 'images/girl3.jpg',
        page: Home(),
      ),
    ];
    filteredItems = allItems;
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xFFEBE3DD),
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                  icon: Icon(
                    Icons.arrow_circle_left,
                    size: 30,
                    color: Color(0xe8000000),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Home()),
                    );
                  },
                ),
              ),
              title: Texxt(
                text1: 'CATEGORIES',
                family: "Titan_One",
                colr: Colors.black,
                size: 25,
              ),
            ),
            backgroundColor: Color(0xFFEBE3DD),
            body: ListView(
              padding: EdgeInsets.symmetric(vertical: 20.h),
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 20),
                  child: TextFormField(
                    controller: searchController,
                    textAlign: TextAlign.left,
                    decoration: InputDecoration(
                      hintText: "search ....",
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp,
                        color: Color(0xFF848484),
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.r),
                      ),
                      suffixIcon:
                          searchController.text.isEmpty
                              ? null
                              : IconButton(
                                icon: Icon(
                                  Icons.cancel_sharp,
                                  color: Color(0xe8000000),
                                ),
                                onPressed: () {
                                  searchController.clear();
                                  setState(() {
                                    filteredItems = allItems;
                                  });
                                },
                              ),
                      prefixIcon: Icon(Icons.search, color: Color(0xe8000000)),
                    ),
                    onChanged: (value) {
                      setState(() {
                        filteredItems =
                            allItems
                                .where(
                                  (item) => item.title.toLowerCase().contains(
                                    value.toLowerCase(),
                                  ),
                                )
                                .toList();
                      });
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Wrap(
                    spacing: 30,
                    runSpacing: 30,
                    alignment: WrapAlignment.center,
                    children:
                        filteredItems.map((item) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Imgbot(
                                curv1: 50,
                                curv2: 50,
                                h: 200,
                                w: 120,
                                img: item.imagePath,
                                page: item.page,
                              ),
                              SizedBox(height: 10.h),
                              Texxt(
                                text1: item.title,
                                family: "",
                                colr: Colors.black,
                                size: 18,
                              ),
                            ],
                          );
                        }).toList(),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
