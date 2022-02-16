import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:htq_boutique_app/modules/home/screen/home_page.dart';
import 'package:htq_boutique_app/modules/orders/screen/order_page.dart';
import 'package:htq_boutique_app/modules/product/screen/product_page.dart';
import 'package:htq_boutique_app/modules/profile/screen/profile_page.dart';
import 'package:htq_boutique_app/modules/setting/screen/setting_page.dart';

import 'favourite/screen/favourite_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _pageSelected = 2;
  final GlobalKey<CurvedNavigationBarState> bottomNavigationKey = GlobalKey<CurvedNavigationBarState>();
  final screens = [
    FavouritePage(),
    ProductPage(),
    HomePage(),
    OrderPage(),
    SettingPage(),
  ];
  @override
  Widget build(BuildContext context) {
    const items = [
      Tooltip(message: "Yêu thích", child: Icon(Icons.favorite, size: 30)),
      Tooltip(message: "Sản phẩm", child: Icon(Icons.how_to_vote_outlined, size: 30)),
      Tooltip(message: "Trang chủ", child: Icon(Icons.home, size: 30)),
      Tooltip(message: "Đơn hàng", child: Icon(Icons.add_shopping_cart, size: 30)),
      Tooltip(message: "Cài đặt", child: Icon(Icons.settings, size: 30)),
    ];
    return SafeArea(
      top: false,
      child: ClipRect(
        child: Scaffold(
          backgroundColor: Colors.blue,
          extendBody: true,
          appBar: AppBar(
              backgroundColor: Colors.orange,
              elevation: 0,
              leading: IconButton(
                onPressed: () {},
                icon: const Icon(Icons.menu_outlined),
              ),
              title: const Text("HQT"),
              actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_active_outlined)), IconButton(onPressed: () {}, icon: const Icon(Icons.person))]),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(iconTheme: const IconThemeData(color: Colors.white)),
            child: CurvedNavigationBar(
                key: bottomNavigationKey,
                animationCurve: Curves.easeInOut,
                animationDuration: const Duration(milliseconds: 200),
                buttonBackgroundColor: Colors.purple,
                color: Colors.orange,
                backgroundColor: Colors.transparent,
                height: 60,
                index: _pageSelected,
                items: items,
                onTap: (index) => setState(() {
                      _pageSelected = index;
                    })),
          ),
          body: screens[_pageSelected],
        ),
      ),
    );
  }
}
