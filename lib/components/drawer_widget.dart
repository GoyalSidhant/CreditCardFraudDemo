import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:furniture_app/screens/money_transfer_page.dart';
import 'package:furniture_app/screens/my_wallet.dart';
import 'package:furniture_app/screens/product/products_screen.dart';
import 'package:furniture_app/screens/shopping_cart_page.dart';
import 'package:kf_drawer/kf_drawer.dart';

class DrawerScreen extends StatefulWidget {
  DrawerScreen({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen>
    with TickerProviderStateMixin {
  KFDrawerController _drawerController;

  @override
  void initState() {
    super.initState();
    _drawerController = KFDrawerController(
      initialPage: ProductsScreen(),
      items: [
        KFDrawerItem.initWithPage(
          text: Text('Products', style: TextStyle(color: Colors.white)),
          icon: Icon(Icons.home, color: Colors.white),
          page: ProductsScreen(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Wallet',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.account_balance_wallet, color: Colors.white),
          page: MyWallet(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Money Transfer',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.attach_money, color: Colors.white),
          page: MoneyTransferPage(),
        ),
        KFDrawerItem.initWithPage(
          text: Text(
            'Shopping Cart',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(Icons.shopping_cart, color: Colors.white),
          page: ShoppingCart(),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: KFDrawer(
        borderRadius: 0.0,
        shadowBorderRadius: 0.0,
        menuPadding: EdgeInsets.all(0.0),
        scrollable: true,
        controller: _drawerController,
        header: Align(
          alignment: Alignment.centerLeft,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            width: MediaQuery.of(context).size.width * 0.6,
            child: Image.asset(
              'assets/images/logo.png',
              alignment: Alignment.centerLeft,
            ),
          ),
        ),
        footer: KFDrawerItem(
          text: Text(
            'SIGN OUT',
            style: TextStyle(color: Colors.white),
          ),
          icon: Icon(
            Icons.input,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.of(context).push(CupertinoPageRoute(
              fullscreenDialog: true,
              builder: (BuildContext context) {
                return ProductsScreen();
              },
            ));
          },
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xff011659),
              Color(0xff01519F),
            ],
            tileMode: TileMode.repeated,
          ),
        ),
      ),
    );
  }
}
