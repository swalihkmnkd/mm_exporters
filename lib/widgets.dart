import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'dashboard.dart';


class Login extends StatelessWidget {

  Widget loginnumber;
  String buttonname;

  Login({
    super.key,
    required Widget this.loginnumber,
    required String this.buttonname,
  });

  @override
  Widget build(BuildContext context) {bool count = context.locale.languageCode == 'ar';
    print(buttonname);
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
                            loginnumber,
                            SizedBox(height: 20),
                            SizedBox(
                              height: 30,
                              width: width,
                              child: FloatingActionButton(
                                backgroundColor: Color(0xff5B5EFC),

                                child: Text(
                                  buttonname,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                                onPressed: () {
                                  if (buttonname.toString() == "Continue".tr()) {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Login(
                                          loginnumber: otp_field(),
                                          buttonname: "Verify".tr(),
                                        ),
                                      ),
                                    );
                                  } else {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => Dashboard(),
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

// phone number textfield for login
Widget phone_field() {
  return Container(
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

//otp textfield widget
Widget otp_field() {
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
        Text("Resend otp".tr(), style: TextStyle(color: Colors.blue, fontSize: 10)),
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

    padding: EdgeInsets.only(left: size*0.03, right:size*0.03),
    margin: EdgeInsets.only(left:size*0.05, right:size*0.05,top: size*0.01),
    decoration: BoxDecoration(
      border: Border.all(color: Color(0xffCFCFCF)),
      borderRadius: BorderRadius.circular(6),
    ),
    child: DropdownButtonHideUnderline(
      child: DropdownButton<String>(
        isDense: false, // Reduces vertical space
        isExpanded: true,focusColor: Color(0xffCFCFCF),
        style: TextStyle(fontSize: 14), hint: Text(text, style: TextStyle(
        overflow: TextOverflow.ellipsis,fontSize: 14,)),
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
