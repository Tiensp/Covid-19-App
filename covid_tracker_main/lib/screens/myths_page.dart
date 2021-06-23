import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

// ignore: must_be_immutable
class MythsScreen extends StatelessWidget {
  final controller = PageController(
    initialPage: 0,
  );

  final imgPath;

  final Color color;

  List<Map<String, String>> myths = [
    {
      "myth": "Muỗi đốt KHÔNG THỂ làm lây truyền dịch bênh SARS-CoV-2",
      "desc": "Nó là một loại virus đường hô hấp lây lan chủ yếu" +
          " thông qua các giọt bắn của người bệnh khi ho, hắt hơi," +
          " hoặc dịch nhầy, nước bọt chảy ra từ mũi, miệng.",
      "imgPath": "assets/myths/mosquito.png",
    },
    {
      "myth":
          "Virus COVID-19 hoàn toàn CÓ THỂ lây lan ở những vùng khí hậu nóng ẩm",
      "desc":
          "Không có lí do gì để tin rằng thời tiết nóng có thể giết chết loại virus Corona mới" +
              " hoặc các bệnh khác. Nó có thể lây truyền trong bất cứ khí hậu nào.",
      "imgPath": "assets/myths/hot.png",
    },
    {
      "myth": "Tỏi KHÔNG bảo vệ con người chống lại sự lây nhiễm của virus Corona",
      "desc": "Tỏi có thể có một số đặc tính chống vi khuẩn." +
          " Tuy nhiên, không có bằng chứng nào cho thấy tỏi" +
          " có thể bảo vệ mọi người chống lại virus Corona.",
      "imgPath": "assets/myths/garlic.png",
    },
    {
      "myth": "Thuốc kháng sinh KHÔNG có tác dụng với virus, chỉ ảnh hưởng đối với vi khuẩn",
      "desc": "Chủng virus Corona mới (2019-nCoV) là virus và do đó, " +
          "thuốc kháng sinh không nên được sử dụng như một phương pháp phòng ngừa hoặc chữa trị.",
      "imgPath": "assets/myths/antibiotics.png",
    },
    {
      "myth": "Các bưu kiện từ Trung Quốc KHÔNG THỂ lây lan virus Corona",
      "desc":
          "Các nhà khoa hoạc tin rằng virus không thể tồn tại trên các lá thư hoặc bưu phẩm" +
              " trong một khoảng thời gian dài. Có rất ít rủi ro " +
              "lây lan virus từ các sản phẩm hoặc gói hàng được vận chuyển.",
      "imgPath": "assets/myths/package.png",
    },
    {
      "myth": "Mèo và chó KHÔNG lây lan virus Corona",
      "desc":
          "Hiện tại, có rất ít bằng chứng cho thấy SARS-CoV-2 có thể lây nhiễm cho " +
              "mèo và chó. Các nhà khoa học vẫn đang tranh luận về vấn đề này" +
              " và tầm quan trọng của nó khi dịch bệnh bùng phát.",
      "imgPath": "assets/myths/dogs.png",
    },
    {
      "myth": "Tất cả mọi lứa tuổi đều có thể mắc SARS-CoV-2",
      "desc": "SARS-CoV-2 có thể lây nhiễm cho mọi người, mọi lứa tuổi, kể cả trẻ em." +
          " Tuy nhiên, người lớn tuổi và những người có bệnh lý nên trước đó" +
          " có nhiều khả năng mắc bệnh nặng hơn.",
      "imgPath": "assets/myths/ages.png",
    },
  ];

  MythsScreen({Key key, this.imgPath, this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(
              Icons.arrow_back,
              color: color,
              size: 28,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          //Cover Image Container
          Container(
            height: 230,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25.0),
                bottomRight: Radius.circular(25.0),
              ),
              color: color.withOpacity(0.2),
            ),
            width: MediaQuery.of(context).size.width,
            child: LayoutBuilder(
              builder: (ctx, constraint) => Stack(
                children: <Widget>[
                  //Title
                  Positioned(
                    top: constraint.maxHeight * 0.45,
                    left: 20,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: constraint.maxWidth * 0.55,
                        child: AutoSizeText(
                          "Cảnh báo",
                          style: TextStyle(
                            color: color,
                            fontFamily: "Montserrat",
                            fontSize: 31,
                            fontWeight: FontWeight.w700,
                          ),
                          stepGranularity: 1,
                          maxFontSize: 31,
                          maxLines: 1,
                        ),
                      ),
                    ),
                  ),

                  //Image
                  Positioned.fill(
                    bottom: -17.0,
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        padding: const EdgeInsets.only(right: 10.0),
                        child: LayoutBuilder(
                          builder: (ctx, constraint) => Hero(
                            tag: imgPath,
                            child: Image(
                              image: AssetImage(imgPath),
                              height: constraint.maxHeight * 0.93,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          //Myth card
          Flexible(
            fit: FlexFit.loose,
            child: Container(
              padding: const EdgeInsets.fromLTRB(16, 20, 16, 15),
              width: MediaQuery.of(context).size.width > 360.0
                  ? MediaQuery.of(context).size.width - 31.0
                  : MediaQuery.of(context).size.width,
              child: Material(
                borderRadius: BorderRadius.circular(15.0),
                elevation: 5,
                child: Column(
                  children: <Widget>[
                    //Details
                    Flexible(
                      fit: FlexFit.loose,
                      child: PageView.builder(
                          controller: controller,
                          physics: BouncingScrollPhysics(),
                          itemCount: myths.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.fromLTRB(23, 35, 23, 15),
                              child: LayoutBuilder(
                                builder: (ctx, constraint) => Column(
                                  crossAxisAlignment: CrossAxisAlignment.stretch,
                                  children: <Widget>[
                                    LimitedBox(
                                      maxHeight: constraint.maxHeight*0.27,
                                      child: Image(
                                        image: AssetImage(
                                            "${myths[index]["imgPath"]}"),
                                        height: 100.0,
                                      ),
                                    ),
                                    SizedBox(
                                      height: constraint.maxHeight*0.11,
                                    ),
                                    LimitedBox(
                                      maxHeight: constraint.maxHeight*0.17,
                                      child: AutoSizeText(
                                        "${myths[index]["myth"]}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 19,
                                          height: 1.1,
                                          fontFamily: "Montserrat",
                                          color: Colors.black,
                                          fontWeight: FontWeight.w600,
                                        ),
                                        maxFontSize: 20,
                                        stepGranularity: 2,
                                        maxLines: 3,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 13,
                                    ),
                                    LimitedBox(
                                      maxHeight: constraint.maxHeight*0.45,
                                      child: AutoSizeText(
                                        "${myths[index]['desc']}",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 16.5,
                                          height: 1.4,
                                          fontFamily: "Montserrat",
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        maxFontSize: 16.5,
                                        stepGranularity: 1.5,
                                        maxLines: 6,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),

                    //Dot Indicator
                    Container(
                      margin: const EdgeInsets.only(bottom: 25),
                      child: SmoothPageIndicator(
                        controller: controller,
                        count: myths.length,
                        effect: WormEffect(
                            dotHeight: 11,
                            dotWidth: 11,
                            spacing: 12.0,
                            strokeWidth: 1.2,
                            dotColor: Colors.grey[400],
                            paintStyle: PaintingStyle.stroke,
                            activeDotColor: Colors.redAccent[700]),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),

          SizedBox(
            height: 8,
          ),
        ],
      ),
    );
  }
}
