import 'package:flutter/material.dart';
import 'package:furniture_app/components/title_text.dart';

class PaymentComplete extends StatefulWidget {
  final bool isFraud;
  PaymentComplete({this.isFraud = true});
  @override
  _PaymentCompleteState createState() => _PaymentCompleteState();
}

class _PaymentCompleteState extends State<PaymentComplete> {
  Widget _cartItems() {
    return Column(children: AppData.cartList.map((x) => _item(x)).toList());
  }

  Widget _item(Product model) {
    return Container(
      height: 80,
      child: Row(
        children: <Widget>[
          AspectRatio(
            aspectRatio: 1.2,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    height: 70,
                    width: 70,
                    child: Stack(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            decoration: BoxDecoration(
                                color: LightColor.lightGrey,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        Image.asset(model.image),
                      ],
                    ),
                  ),
                ),
//                Positioned(
//                  left: -20,
//                  bottom: -20,
//                  child: Image.asset(model.image),
//                )
              ],
            ),
          ),
          Expanded(
              child: ListTile(
                  title: TitleText(
                    text: model.name,
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                  subtitle: Row(
                    children: <Widget>[
                      TitleText(
                        text: '\$ ',
                        color: Color(0xFF035AA6),
                        fontSize: 12,
                      ),
                      TitleText(
                        text: model.price.toString(),
                        fontSize: 14,
                      ),
                    ],
                  ),
                  trailing: Container(
                    width: 35,
                    height: 35,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: LightColor.lightGrey.withAlpha(150),
                        borderRadius: BorderRadius.circular(10)),
                    child: TitleText(
                      text: 'x${model.id}',
                      fontSize: 12,
                    ),
                  )))
        ],
      ),
    );
  }

  Widget _price() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            TitleText(
              text: '${AppData.cartList.length} Items: Transaction Amount:',
              color: LightColor.grey,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
            TitleText(
              text: '\$${getPrice()}',
              fontSize: 18,
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        TitleText(
          text: widget.isFraud
              ? 'Payment failed due to incorrect Customer, Account or Transaction Credentials'
              : 'Payment successful, the products have been dispatched and will be delivered by 21/08/20',
          fontSize: 18,
        ),
      ],
    );
  }

//  Widget _submitButton(BuildContext context) {
//    return FlatButton(
//        onPressed: () {
//          Navigator.push(context, MaterialPageRoute(builder: (context) {
//            return MakePaymentScreen();
//          }));
//        },
//        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//        color: Color(0xFF035AA6),
//        child: Container(
//          alignment: Alignment.center,
//          padding: EdgeInsets.symmetric(vertical: 12),
//          width: MediaQuery.of(context).size.width * .7,
//          child: TitleText(
//            text: 'Next',
//            color: LightColor.background,
//            fontWeight: FontWeight.w500,
//          ),
//        ));
//  }

  double getPrice() {
    double price = 0;
    AppData.cartList.forEach((x) {
      price += x.price * x.id;
    });
    return price;
  }

  Widget _appBar() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            height: 40.0,
            width: 40.0,
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(13)),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: <BoxShadow>[
                    BoxShadow(
                        color: Color(0xfff8f8f8),
                        blurRadius: 10,
                        spreadRadius: 10),
                  ],
                ),
                child: Image.asset("assets/images/mohan.jpg"),
              ),
            ),
          ),
//          IconButton(
//            icon: Icon(
//              Icons.sort,
//              color: Colors.black,
//            ),
//            onPressed: widget.onMenuPressed,
//          ),
        ],
      ),
    );
  }

  Widget _title() {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TitleText(
                  text: 'Payment',
                  fontSize: 27,
                  fontWeight: FontWeight.w400,
                ),
                TitleText(
                  text: 'Summary',
                  fontSize: 27,
                  fontWeight: FontWeight.w700,
                ),
              ],
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(10),
              child: Icon(
                widget.isFraud ? Icons.clear : Icons.done,
                color: widget.isFraud ? Colors.red : Colors.green,
              ),
            )
          ],
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 50,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xfffbfbfb),
                Color(0xfff7f7f7),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _appBar(),
              _title(),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                  children: <Widget>[
                    _cartItems(),
                    Divider(
                      thickness: 1,
                      height: 70,
                    ),
                    _price(),
                    SizedBox(height: 30),
//                    _submitButton(context),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LightColor {
  static const Color background = Color(0XFFFFFFFF);

  static const Color titleTextColor = const Color(0xff1d2635);
  static const Color subTitleTextColor = const Color(0xff797878);

  static const Color skyBlue = Color(0xff2890c8);
  static const Color lightBlue = Color(0xff5c3dff);

  static const Color orange = Color(0xffE65829);
  static const Color red = Color(0xffF72804);

  static const Color lightGrey = Color(0xffE1E2E4);
  static const Color grey = Color(0xffA1A3A6);
  static const Color darkgrey = Color(0xff747F8F);

  static const Color iconColor = Color(0xffa8a09b);
  static const Color yellowColor = Color(0xfffbba01);

  static const Color black = Color(0xff20262C);
  static const Color lightblack = Color(0xff5F5F60);
}

class Product {
  int id;
  String name;
  String category;
  String image;
  double price;
  bool isliked;
  bool isSelected;
  Product(
      {this.id,
      this.name,
      this.category,
      this.price,
      this.isliked,
      this.isSelected = false,
      this.image});
}

class Category {
  int id;
  String name;
  String image;
  bool isSelected;
  Category({this.id, this.name, this.isSelected = false, this.image});
}

class AppData {
  static List<Product> productList = [
    Product(
        id: 1,
        name: 'Classic Leather Arm Chair',
        price: 56.00,
        isSelected: true,
        isliked: false,
        image: 'assets/images/item_1.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Poppy Plastic Tub Chair',
        price: 68.00,
        isliked: false,
        image: 'assets/shoe_tilt_2.png',
        category: "Trending Now"),
  ];
  static List<Product> cartList = [
    Product(
        id: 1,
        name: 'Classic Leather Arm Chair',
        price: 56.00,
        isSelected: true,
        isliked: false,
        image: 'assets/images/Item_1.png',
        category: "Trending Now"),
    Product(
        id: 2,
        name: 'Poppy Plastic Tub Chair',
        price: 68.00,
        isliked: false,
        image: 'assets/images/Item_2.png',
        category: "Trending Now"),
    Product(
        id: 1,
        name: 'Bar Stool Chair',
        price: 39.00,
        isliked: false,
        image: 'assets/images/Item_3.png',
        category: "Trending Now"),
  ];
  static List<Category> categoryList = [
    Category(),
    Category(
        id: 1,
        name: "Sneakers",
        image: 'assets/shoe_thumb_2.png',
        isSelected: true),
    Category(id: 2, name: "Jacket", image: 'assets/jacket.png'),
    Category(id: 3, name: "Watch", image: 'assets/watch.png'),
    Category(id: 4, name: "Watch", image: 'assets/watch.png'),
  ];
  static List<String> showThumbnailList = [
    "assets/shoe_thumb_5.png",
    "assets/shoe_thumb_1.png",
    "assets/shoe_thumb_4.png",
    "assets/shoe_thumb_3.png",
  ];
  static String description =
      "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey.";
}
