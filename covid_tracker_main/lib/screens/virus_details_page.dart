import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class VirusDetailsScreen extends StatelessWidget {
  final imgPath;
  final Color color;

  static List<Map<String, String>> details = [
    {
      "detail": "Giới thiệu",
      "desc":
          "Corona là một betacoronavirus, giống như MERS và SAR, tất cả đều có nguồn gốc " +
          "từ vật chủ từ loài dơi. Virus corona là một họ virus lớn, phổ biến ở nhiều loài " +
          "động vật khác nhau bao gồm lạc đà, mèo và dơi.\n\nPhân tích cây di truyền của virus " +
          "này đang được tiếp tục để biết nguồn gốc cụ thể của virus. SARS, một loại " +
          "coronavirus khác xuất hiện lây nhiễm cho người, bắt nguồn loài từ cầy hương, " +
          "trong khi MERS, một loại coronavirus khác lây nhiễm cho người, bắt nguồn từ lạc đà."
    },
    {
      "detail": "Nguồn gốc",
      "desc": "Các cơ quan y tế và đối tác y tế đang nỗ lực để xác định nguồn gốc của 2019-nCoV." +
              "\nCoronavirus 2019 (2019-nCoV) là virus đường hô hấp mới gây bệnh viêm đường hô hấp cấp " +
              "ở người và có thể lây lan từ người sang người. Virus này được xác định trong một cuộc " +
              "điều tra ổ dịch bắt nguồn từ khu chợ lớn chuyên bán hải sản và động vật " +
              "ở Vũ Hán, tỉnh Hồ Bắc, Trung Quốc. \n\n2019-nCoV là chủng virus mới chưa được xác định trước đó. " +
              "Ngoài chủng coronavirus mới phát hiện này, đã có nhiều chủng coronavirus khác " +
              "được biết tới ngày nay có khả năng lây nhiễm ở người với nhiều biến thể có khả năng lây nhiễm " +
              "cao hơn và kháng vacxin cao hơn."
    },
    {
      "detail": "Corona nguy hiểm như thế nào?",
      "desc": "Có thể nói, Covid-19 là thảm họa mang lại thiệt hại nặng nề nhất cho nhân loại," +
              " kể từ sau chiến tranh thế giới thứ hai. Sau gần 1 năm Covid-19 bùng lên tại Trung Quốc," +
              " dịch bệnh vẫn tiếp tục ảnh hưởng đến cuộc sống của người dân toàn thế giới với " +
              "những diễn biến khôn lường. Thậm chí, bệnh vẫn tiếp tục gia tăng, mặc dù nhiều nước đã " +
              "tích cực áp dụng các biện pháp phòng, chống bệnh." +
              "\n\nLàn sóng Covid-19 đang đe dọa nghiêm trọng đến sức khỏe người dân, cướp đi mạng sống " +
              "của hàng triệu người trên khắp thế giới. \nĐáng sợ hơn, người nhiễm Covid-19 thường có " +
              "diễn biến thất thường và phức tạp. Ở giai đoạn đầu, bệnh diễn biến chậm và âm thầm, " +
              "nhưng sau đó rất nhiều ca bệnh đột ngột diễn biến nặng, phải thở oxy, thở máy, hoặc " +
              "hỗ trợ tuần hoàn hô hấp.",
    },
    {
      "detail": "Nó lây truyền như thế nào?",
      "desc": "Vi-rút này ban đầu xuất hiện từ nguồn động vật nhưng có khả năng lây lan " +
          "từ người sang người. \n\nĐiều quan trọng cần lưu ý là sự lây lan từ người sang người " +
          "có thể xảy ra liên tục. Ở người, virus lây từ người này sang người kia " +
          "thông qua tiếp xúc với dịch cơ thể của người bệnh. Tùy thuộc vào mức độ " +
          "lây lan của chủng virus, việc ho, hắt hơi hay bắt tay có thể khiến người " +
          "xung quanh bị phơi nhiễm. \n\nVirus cũng có thể bị lây từ việc ai đó chạm tay " +
          "vào một vật mà người bệnh chạm vào, sau đó đưa lên miệng, mũi, mắt họ. " +
          "Những người chăm sóc bệnh nhân cũng có thể bị phơi nhiễm virus khi xử lý " +
          "các chất thải của người bệnh.",
    },
    {
      "detail": "Đã có Vaccine ngừa Covid-19 chưa?",
      "desc": "Hiện tại đã có rất nhiều chủng loại vaccine ngừa Covid-19 được đưa vào sử dụng" +
          "trên toàn thế giới. \nTuy nhiên, số lượng chủng loại, biến thể của Corona đang ngày một " +
          "mạnh mẽ và nguy hiểm hơn. Một số biến chủng mới cho tốc độ lây lan nhanh và có dấu hiệu " +
          "kháng những vaccine hiện có. \n\nVì vậy, các nhà khoa học trên thế giới vẫn đang nỗ lực không " +
          "ngừng để tạo ra những loại vaccine tốt nhất ngăn ngừa dịch bệnh."
    },
  ];

  static AutoSizeGroup titleGrp = AutoSizeGroup();
  static AutoSizeGroup descGrp = AutoSizeGroup();

  const VirusDetailsScreen({Key key, this.imgPath, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double pageHeight = MediaQuery.of(context).size.height;
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
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        height: pageHeight,
        child: Column(
          children: <Widget>[
            //image tag container
            Container(
              height: 220,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(25.0),
                    bottomRight: Radius.circular(25.0),
                  ),
                  color: color.withOpacity(0.2)),
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
                            "SARS-CoV-2",
                            style: TextStyle(
                              color: color,
                              fontFamily: "Montserrat",
                              fontSize: 30,
                              fontWeight: FontWeight.w700,
                            ),
                            stepGranularity: 2,
                            maxFontSize: 30,
                            maxLines: 1,
                          ),
                        ),
                      ),
                    ),

                    //Image
                    Positioned.fill(
                      right: -90,
                      bottom: -30,
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: LayoutBuilder(
                          builder: (ctx, constraint) => Hero(
                              tag: imgPath,
                              child: Image(
                                image: AssetImage(imgPath),
                                height: constraint.maxHeight * 0.92,
                              )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //Details List
            Container(
              height: pageHeight - 220,
              padding: const EdgeInsets.fromLTRB(25, 20, 25, 0),
              child: ListView.builder(
                physics: BouncingScrollPhysics(),
                padding: const EdgeInsets.all(0),
                scrollDirection: Axis.vertical,
                itemCount: details.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: LayoutBuilder(
                      builder: (ctx, constraint) => LimitedBox(
                        maxWidth: constraint.maxWidth,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            AutoSizeText(
                              "${details[index]["detail"]}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 28,
                                fontFamily: "Montserrat",
                                color: color,
                                fontWeight: FontWeight.w700,
                              ),
                              maxFontSize: 28,
                              stepGranularity: 2,
                              maxLines: 3,
                              group: titleGrp,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            AutoSizeText(
                              "${details[index]['desc']}",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontSize: 18,
                                height: 1.5,
                                fontFamily: "Montserrat",
                                color: Colors.grey[850],
                                letterSpacing: 0.5,
                                fontWeight: FontWeight.w500,
                              ),
                              maxFontSize: 18,
                              group: descGrp,
                              stepGranularity: 2,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
