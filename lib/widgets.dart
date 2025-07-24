import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:mm_exporters/provider.dart';
import 'package:provider/provider.dart';
import 'dash_board.dart';

class LoginWidget extends StatelessWidget {
  final Widget loginNumber;
  final String buttonName;

  const LoginWidget({super.key, required this.loginNumber, required this.buttonName});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        height: height,
        child: ListView(
          padding: EdgeInsets.only(top: height * 0.2),
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: 204,
                    width: width * 0.3,
                    child: Image.asset("assets/img.png"),
                  ),
                  Card(
                    color: Colors.white,
                    elevation: 3,
                    child: Padding(
                      padding: EdgeInsetsGeometry.all(20),
                      child: SizedBox(
                        height: 204,
                        width: 300,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              'Welcome !'.tr(),
                              style: TextStyle(
                                color: Color(0xff2B2129),
                                fontSize: 20,
                                fontFamily: 'Poppins',
                              ),
                            ),
                            Text(
                              "Log in with your mobile number and OTP".tr(),
                              style: TextStyle(
                                color: Color(0xff2B2129),
                                fontSize: 10,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                            SizedBox(height: 30),
                            loginNumber,
                            SizedBox(height: 20),
                            SizedBox(
                              height: 30,
                              width: width,
                              child: FloatingActionButton(
                                backgroundColor: Color(0xff5B5EFC),

                                child: Text(
                                  buttonName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                                onPressed: () {
                                  if (buttonName.toString() ==
                                      "Continue".tr()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => LoginWidget(
                                          loginNumber: otpField(),
                                          buttonName: "Verify".tr(),
                                        ),
                                      ),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DashBoard(),
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// phone number text field for login
Widget phoneField() {
  return SizedBox(
    height: 30,
    child: TextField(
      keyboardType: TextInputType.phone,
      style: TextStyle(
        fontSize: 10.0, // Set your desired font size here
      ),
      decoration: InputDecoration(
        hintText: "+91-7890879345",
        labelText: "Phone Number".tr(),
        labelStyle: TextStyle(fontSize: 10),

        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38, width: 1),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black26, width: 1),
        ),
      ),
    ),
  );
}

//otp text field widget
Widget otpField() {
  return SizedBox(
    height: 73,
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 40,
          child: OtpTextField(
            showFieldAsBox: true,
            borderWidth: 1.0,
            textStyle: TextStyle(fontSize: 10),
            numberOfFields: 5,
            borderColor: Color(0xFF512DA8),

            onCodeChanged: (String code) {},
            onSubmit: (String verificationCode) {}, // end onSubmit
          ),
        ),
        SizedBox(height: 10),
        Text(
          "Resend otp".tr(),
          style: TextStyle(color: Colors.blue, fontSize: 10),
        ),
      ],
    ),
  );
}

Widget dashboardItems({required String iconImage, required String itemName}) {
  return InkWell(
    child: Container(
      height: 40,
      margin: EdgeInsets.only(top: 10, left: 15, right: 15),
      decoration: BoxDecoration(
        color: Color(0xffF0E100),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: Image.asset(
              iconImage,
              height: 15,
              width: 15,
              color: Colors.black,
            ),
          ),
          Text(itemName, style: TextStyle(fontSize: 10)),
        ],
      ),
    ),
    onTap: () {},
  );
}

Widget dashboardDropdown({
  required double size,
  required String text,
  required String? selected,
  required List<String> items,
  required ValueChanged<String?> onChanged,
}) {
  return Container(
    height: 36,
    width: size,

    padding: EdgeInsets.only(left: size * 0.03, right: size * 0.03),
    margin: EdgeInsets.only(
      left: size * 0.05,
      right: size * 0.05,
      top: size * 0.01,
    ),
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xffCFCFCF)),
      borderRadius: BorderRadius.circular(6),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isDense: false, // Reduces vertical space
        isExpanded: true,
        focusColor: Color(0xffCFCFCF),
        style: TextStyle(fontSize: 14),
        hint: Text(
          text,
          style: TextStyle(overflow: TextOverflow.ellipsis, fontSize: 14),
        ),
        icon: Icon(Icons.keyboard_arrow_down, size: 20),
        borderRadius: BorderRadius.circular(2),
        value: selected,
        onChanged: onChanged,
        items: items.map<DropdownMenuItem<String>>((String day) {
          return DropdownMenuItem<String>(value: day, child: Text(day.tr()));
        }).toList(),
      ),
    ),
  );
}

Widget dataColumnShipment({required double width, String text = ""}) {
  return Align(
    alignment: Alignment.centerLeft,

    child: Container(
      height: 100,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 1),
        color: Color(0xffDEB9A3),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
        ),
      ),
    ),
  );
}

Widget dataRowShipment({
  String whiteBoxText = "",
  bool isWhiteBox = false,
  int noOfItem = 1,
  bool isList = false,
  required double width,
  bool isImage = false,
  String image = "",
  String listText = '',
  String singleText = "",
}) {
  return Container(
    height: noOfItem <= 1 ? null : noOfItem * 40,
    width: width,
    decoration: BoxDecoration(
      border: Border(
        top: BorderSide(color: Colors.white, width: 2),
        bottom: BorderSide(color: Color(0xffDEB9A3), width: 2),
      ),
    ),
    child: isList
        ? ListView.builder(
            itemBuilder: (context, index) {
              return isImage
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 1, top: 1),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          width: 30,
                          height: 29,
                          image,
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 6,
                        horizontal: 0,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          listText,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    );
            },
            itemCount: noOfItem,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
          )
        : isWhiteBox
        ? Padding(
            padding: const EdgeInsets.all(1),
            child: Container(
              width: 75,

              decoration: BoxDecoration(
                border: Border.all(color: Color(0xffCCCCCC), width: 1),
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  whiteBoxText,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
              ),
            ),
          )
        : Center(
            child: Text(
              singleText.tr(),
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
            ),
          ),
  );
}

Widget tableHeading({String text = ""}) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 8.0),
    child: Text(text, style: TextStyle(fontWeight: FontWeight.bold)),
  );
}

Widget pageIndicator({required List list, required int itemsPerPage}) {
  return Consumer<MainProvider>(
    builder: (context, value, child) {
      int stylePageNumber = (list.length + itemsPerPage - 1) ~/ itemsPerPage;
      bool count = context.locale.languageCode == 'ar';
      return SizedBox(
        height: 30,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              width: 30,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    value.getCurrentPageItems(
                      value.currentPage >= 1 ? value.currentPage - 1 : 0,
                      10,
                    );
                  },
                  icon: Icon(Icons.arrow_back, size: 20),
                ),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: stylePageNumber,
              itemBuilder: (context, index) => OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                    color: value.currentPage == index
                        ? Color(0xffD5D7DA)
                        : Color(0xffF7F7F7),
                    width: 1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                onPressed: () {
                  value.getCurrentPageItems(index, 10);
                },
                child: Text(
                  count == true
                      ? value.toArabicDigits("${index + 1}")
                      : "${index + 1}",
                ),
              ),
            ),
            IconButton(
              onPressed: () {
                value.getCurrentPageItems(
                  value.currentPage <= stylePageNumber - 2
                      ? value.currentPage + 1
                      : stylePageNumber - 1,
                  10,
                );
              },
              icon: Icon(Icons.arrow_forward, size: 20),
            ),
          ],
        ),
      );
    },
  );
}
