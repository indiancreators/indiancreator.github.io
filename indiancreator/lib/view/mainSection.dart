import 'package:flutter/material.dart';
import 'package:indiancreator/utils/constants.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import '../animation/entranceFader.dart';
import '../res/color/app_colors.dart';
import '../widgets/arrowOnTop.dart';
import 'about/about.dart';
import 'contact/contact.dart';
import 'home/home.dart';
import 'services/services.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final ScrollController _scrollController =
      ScrollController(initialScrollOffset: 25.0);
  final ItemScrollController _itemScrollController = ItemScrollController();
  final ItemPositionsListener _itemPositionListener =
      ItemPositionsListener.create();

  final List<String> _sectionsName = [
    "Home",
    "Our Services",
    "About",
    "Contact",
    "Contact Us"
  ];

  void _scroll(int i) {
    _itemScrollController.scrollTo(
        index: i, duration: const Duration(seconds: 1));
  }

  Widget sectionWidget(int i) {
    if (i == 0) {
      return HomePage();
    } else if (i == 1) {
      return Services();
    } else if (i == 2) {
      return About();
    } else if (i == 3) {
      return Contact();
    } else if (i == 4) {
      return Container(
        color: Colors.white,
        height: 40.0,
      );
    } else if (i == 5) {
      return ArrowOnTop(
        onPressed: () => _scroll(0),
      );
    } else {
      return Container(
        color: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white54,
      // extendBodyBehindAppBar: true,
      // extendBody: true    ,
      appBar: MediaQuery.of(context).size.width > 760
          ? PreferredSize(
              preferredSize: const Size.fromHeight(50),
              child: _appBarTabDesktop(),
            )
          : AppBar(
              iconTheme: const IconThemeData(color: Colors.black),
              backgroundColor: Colors.transparent,
              elevation: 0.0,
            ),
      drawer:
          MediaQuery.of(context).size.width < 760 ? _appBarMobile() : null,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: RawScrollbar(
          controller: _scrollController,
          thumbColor: kPrimaryColor,
          thickness: 5.0,
          child: ScrollablePositionedList.builder(
            itemScrollController: _itemScrollController,
            itemPositionsListener: _itemPositionListener,
            itemCount: 8,
            itemBuilder: (context, index) {
              return sectionWidget(index);
            },
          ),
        ),
      ),
    );
  }

  Widget _appBarActions(String childText, int index) {
    return EntranceFader(
      offset: const Offset(0, -20),
      delay: const Duration(seconds: 3),
      duration: const Duration(seconds: 1),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: MaterialButton(
          hoverColor: mColor,
          onPressed: () => _scroll(index),
          child: Text(
            childText,
            style:  TextStyle(color: cWhite),
          ),
        ),
      ),
    );
  }

  Widget _appBarTabDesktop() {
    return AppBar(
      elevation: 0.0,
      backgroundColor: mColor,
      title: MediaQuery.of(context).size.width < 740
          ? EntranceFader(
              duration: const Duration(seconds: 1),
              offset: const Offset(0, -20),
              delay: const Duration(seconds: 3),
              )
          : EntranceFader(
              offset: const Offset(0, -20),
              duration: const Duration(seconds: 1),
              delay: const Duration(seconds: 3),
              // child: NavBarLogo(
              //   height: MediaQuery.of(context).size.height * 0.029,
              // ),
            ),
      actions: [
        for (int i = 0; i < _sectionsName.length; i++)
          _appBarActions(_sectionsName[i], i),
        const SizedBox(width: 60,)
      ],
    );
  }

  Widget _appBarMobile() {
    return const Drawer();
  }
}
