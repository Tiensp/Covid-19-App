import 'package:flutter/material.dart';
import 'home_category.dart';
import 'package:auto_size_text/auto_size_text.dart';

// ignore: must_be_immutable
class HomeCategories extends StatelessWidget {
  const HomeCategories();
  static AutoSizeGroup titleGrp = AutoSizeGroup();
  static AutoSizeGroup descGrp = AutoSizeGroup();

  static List<Map<String, dynamic>> categoryData = [
    {
      "imgLeft": 5.0,
      "imgBottom": 19.0,
      "imgHeight": 122.0,
      "imgPath": "assets/stats.png",
      "displayName": "Thống kê",
      "tabName": "Statistics",
      "tabDesc": "Số liệu thống kê dịch bệnh Covid-19",
      "color": Colors.deepPurpleAccent,
    },
    {
      "imgLeft": 15.0,
      "imgBottom": -8.0,
      "imgHeight": 150.0,
      "imgPath": "assets/symptoms/symptoms.png",
      "displayName": "Triệu chứng",
      "tabName": "Symptoms",
      "tabDesc": "Những triệu chứng thường gặp",
      "color": Colors.teal[800],
    },
    {
      "imgLeft": 15.0,
      "imgBottom": 0.0,
      "imgHeight": 140.0,
      "imgPath": "assets/prevention/boy.png",
      "displayName": "Phòng tránh",
      "tabName": "Precautions",
      "tabDesc": "Cách phòng tránh mắc bệnh",
      "color": Colors.lightBlue[700],
    },
    {
      "imgLeft": 20.0,
      "imgBottom": -30.0,
      "imgHeight": 170.0,
      "imgPath": "assets/myths/myths.png",
      "displayName": "Cảnh báo",
      "tabName": "Myths",
      "tabDesc": "Những điều cần lưu ý về Covid-19",
      "color": Colors.redAccent[700],
    },
    {
      "imgLeft": 3.0,
      "imgBottom": 10.0,
      "imgHeight": 130.0,
      "imgPath": "assets/corona.png",
      "displayName": "Virus Covid-19",
      "tabName": "Virus",
      "tabDesc": "Hiểu thêm về virus Corona",
      "color": Colors.orange[700],
    },
    {
      "imgLeft": 8.0,
      "imgBottom": -4.0,
      "imgHeight": 146.0,
      "imgPath": "assets/updates/updates.png",
      "displayName": "Tin tức",
      "tabName": "Updates",
      "tabDesc": "Tin tức mới nhất về Covid-19",
      "color": Colors.greenAccent[700],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/covid-bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                  height: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 60),
                        child: Column(
                          children: [
                            Text('CORONA',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w800,
                                    color: Colors.white)),
                            Text('Virus',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white)),
                          ],
                        ),
                      )
                    ],
                  )),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  height: MediaQuery.of(context).size.height - 200 - kToolbarHeight,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white,
                  ),
                  child: ListView.builder(
                    itemCount: categoryData.length,
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      var cat = categoryData[index];
                      return CategoryTab(
                        titleGrp: titleGrp,
                        descGrp: descGrp,
                        imgPath: cat["imgPath"],
                        imgBottom: cat["imgBottom"],
                        imgHeight: cat["imgHeight"],
                        imgLeft: cat["imgLeft"],
                        displayName: cat["displayName"],
                        tabDesc: cat["tabDesc"],
                        tabName: cat["tabName"],
                        color: cat["color"],
                      );
                    },
                  )),
            ],
          )),
    );
  }
}
