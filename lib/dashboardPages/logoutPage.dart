import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mm_exporters/login_page.dart';
import 'package:mm_exporters/provider.dart';
import 'package:provider/provider.dart';


class Logoutpage extends StatelessWidget {
   Logoutpage({super.key});

  @override
  Widget build(BuildContext context) {final width = MediaQuery.of(context).size.width;
    final  mainProvider=Provider.of<MainProvider>(context,listen: true);
    bool count = context.locale.languageCode == 'ar';
    return Scaffold(appBar: AppBar(automaticallyImplyLeading: false,backgroundColor: Color(0xffF7F7F7),shape: Border(bottom: BorderSide(width: 1, color: Color(0xffCFCFCF))),title: Center(child: Text("Profile".tr(), style: TextStyle(fontSize: width * 0.02))),),
      backgroundColor: Color(0xffF7F7F7),
      body: Column(
        children: [


          Expanded(
            child: ListView(
              children: [
                //SizedBox(height: 20,),
                Center(
                  child: SizedBox(
                    height: 350,
                    width: 300,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2),
                      ),
                      color: Colors.white,
                      child:Padding( padding:EdgeInsets.all(20),child: Column(
                        children: [
                          Image.asset("assets/img_17.png",height:50,width: 50,),
                          Text(
                            "John Ebraham".tr(),
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text("Asst.buyer".tr(), style: TextStyle(fontSize: 10)),
                          Text(
                            count==false?"+916282001569":mainProvider.toArabicDigits(" 916282001569+"),
                            style: TextStyle(fontSize: 20),
                          ),
                         SizedBox(height: 10,),
                         SizedBox(width:250,child:  OutlinedButton( style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xffF6F6F6), // Background color
                            side: BorderSide(color: Colors.grey, width:1), // Border color and width
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2), // Rounded corners
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          ),
                            onPressed: () {},
                            child: Text("Edit Profile".tr(),style: TextStyle(color: Colors.grey),),
                          ),),
                           Align(alignment:Alignment.centerLeft,child: Text("Language".tr(), style: TextStyle(fontSize: 10)),),
                           Consumer<MainProvider>(
                             builder: (context,value,child) {
                               return Row(
                                children: [
                                  Checkbox(
                                    value: value.language=="English"?true:false,
                                    onChanged: (bool? newValue) {
                               value.changeLanguageSelection("English");

                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ), // Adjust for roundness
                                    ),
                                  ),
                                  Text("English"),
                                  Checkbox(
                                    value:value.language=="Arabic"?true:false,
                                    onChanged: (bool? newValue) {
                                      value.changeLanguageSelection("Arabic");
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                        10,
                                      ), // Adjust for roundness
                                    ),
                                  ),
                                  Text("العربية"),
                                ],
                                                         );
                             }
                           ),
                          SizedBox(width:250,child: OutlinedButton( style: OutlinedButton.styleFrom(
                            backgroundColor: Color(0xffF6F6F6), // Background color
                            side: BorderSide(color: Colors.grey, width:1), // Border color and width
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(2), // Rounded corners
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          ),
                            onPressed: () {
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),),);
                            },
                            child: Text(
                              "Logout".tr(),
                              style: TextStyle(color: Colors.red),
                            ),
                          ),)
                        ],
                      ),)
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
