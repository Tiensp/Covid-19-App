import '../widgets/home_page_widgets/home_categories.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:permission_handler/permission_handler.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  Future<bool> checkIfPermissionGranted() async {
    bool _permitted = false;
    if (await Permission.location.request().isGranted) {
      _permitted = true;
    }
    return _permitted;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkIfPermissionGranted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        //TODO: Add a drawer window
        backgroundColor: Color.fromRGBO(37, 114, 122, 1),
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.info_outline,
              color: Colors.white,
            ),
          )
        ],
        centerTitle: true,
        title: AutoSizeText(
          "Theo dõi dịch Covid-19",
          style: TextStyle(
            fontSize: 20,
            fontFamily: "Montserrat",
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          minFontSize: 14,
          stepGranularity: 2,
          maxLines: 1,
        ),
      ),
      body: HomeCategories(),
    );
  }
}
