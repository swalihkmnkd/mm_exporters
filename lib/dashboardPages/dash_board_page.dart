import 'package:flutter/material.dart';import 'package:easy_localization/easy_localization.dart';

import 'package:mm_exporters/widgets.dart';
import 'package:provider/provider.dart';
import 'package:mm_exporters/provider.dart';


class DashBoardPage extends StatelessWidget {
  const DashBoardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final  mainProvider=Provider.of<MainProvider>(context,listen: true);
    bool count =  context.locale.languageCode == 'ar';
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        shape: Border(bottom: BorderSide(width: 1, color: Color(0xffCFCFCF))),
        elevation: 1,
        title: Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: SizedBox(
            width: MediaQuery.of(context).size.width * 0.7,
            child: Consumer<MainProvider>(
              builder: (context, value, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.15,
                      child: Text(
                       'Dashboard'.tr(),
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.02,
                        ),
                      ),
                    ),
                    dashboardDropdown(
                      size: MediaQuery.of(context).size.width * 0.16,
                      text: "mm Exporters",
                      selected: value.selectedDayItem,
                      items: value.mmExpoeters,
                      onChanged: (newValue) {
                        value.selectDay(newValue.toString());
                      },
                    ),
                    dashboardDropdown(
                      size: MediaQuery.of(context).size.width * 0.13,
                      text: "Seasons".tr(),
                      selected: value.selectedSeasonItem,
                      items: value.seasons,
                      onChanged: (newValue) {
                        value.selectedseason(newValue.toString());
                      },
                    ),
                    dashboardDropdown(
                      size: MediaQuery.of(context).size.width * 0.11,
                      text: "Years",
                      selected: value.selectedYearItem,
                      items:value.years,
                      onChanged: (newValue) {
                        value.selectedYear(newValue.toString());
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xffF7F7F7),
      body: ListView(
        children: [
          Container(
            height: 80,
            padding: EdgeInsets.all(15),
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xff2B2EE0), Color(0xff5B5EFC)],
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  height: 72,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [

                      Image.asset("assets/img_11.png", height: 72, width: 72),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Knitted".tr(), style: TextStyle(color: Colors.white)),
                          Text("Woven".tr(), style: TextStyle(color: Colors.white)),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            count==true?mainProvider.toArabicDigits("34"):"34",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            count==true?mainProvider.toArabicDigits("34"):"34",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Total Styles".tr()),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                         count==true?mainProvider.toArabicDigits("75"):"75",
                          //mainProvider.toArabicDigits("74"),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 19,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Consumer<MainProvider>(
            builder: (context, value, child) {
              return Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  child: GridView.builder(
                    shrinkWrap: true,
                    // let GridView size itself based on content
                    physics: const NeverScrollableScrollPhysics(),
                    // p
                    itemCount: value.cardSubtitle.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,

                      crossAxisCount: MediaQuery.of(context).size.width <= 886
                          ? 2
                          : 4,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        child: Center(
                          child: ListTile(
                            title: Padding(
                              padding: EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    value.cardIcons[index],
                                    height: 40,
                                    width: 40,
                                  ),
                                  SizedBox(width: 15, height: 10),
                                  Text(
                                  count==false?value.cardTitle[index]:value.toArabicDigits(value.cardTitle[index]),
                                    style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            subtitle: Container(
                              height: 25,
                              decoration: BoxDecoration(
                                color: Color(0xffF6F6F6),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Center(
                                child: Text(
                                value.cardSubtitle[index].tr(),
                                  style: TextStyle(
                                    color:
                                        value.cardSubtitle[index] == "Cancelled"||value.cardSubtitle[index].tr()=="تم الإلغاء"
                                        ? Colors.red
                                        : Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
