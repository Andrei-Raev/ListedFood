import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:listed_food/generated/l10n.dart';
import 'package:listed_food/screens/profile_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'meal_list.dart';
import 'product_list.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  PageController? _pageController = null;
  int _currentIndex = 0;
  late ProductList productList;
  late MealList mealList;

  @override
  void initState() {
    super.initState();
    productList = ProductList();
    mealList = MealList();
    _loadSavedPage();
  }

  void changePage(int index) {
    if (index == _currentIndex) return;
    if (_pageController == null) return;
    _pageController!.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
    );
  }

  Future<void> _loadSavedPage() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    _currentIndex = prefs.getInt('currentPage') ?? 0;
    _pageController = PageController(initialPage: _currentIndex);
    setState(() {});
  }

  Future<void> _saveCurrentPage(int index) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('currentPage', index);
  }


  @override
  Widget build(BuildContext context) {
    if (_pageController == null) return Container();
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).colorScheme.primary,
        onTap: changePage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: S.of(context).foodList,
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/plate.svg',
              width: IconTheme.of(context).size,
              height: IconTheme.of(context).size,
              colorFilter: ColorFilter.mode(Color(0xFF757575), BlendMode.srcIn),
            ),
            activeIcon:SvgPicture.asset(
              'assets/icons/plate.svg',
              width: IconTheme.of(context).size,
              height: IconTheme.of(context).size,
              colorFilter: ColorFilter.mode(Theme.of(context).colorScheme.primary, BlendMode.srcIn),
            ) ,
            label: S.of(context).recipesList,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: S.of(context).profile,
          ),
        ],
        currentIndex: _currentIndex,
      ),
      body: PageView(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
            _saveCurrentPage(index);
          });
        },
        children: [
          productList,
          mealList,
          ProfileScreen(),
        ],
      ),
    );
  }
}
