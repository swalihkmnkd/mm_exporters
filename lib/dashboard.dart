import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mm_exporters/provider.dart';
import 'package:provider/provider.dart';

class DashBoard extends StatelessWidget {
  const DashBoard({super.key});


  @override
  Widget build(BuildContext context) { List<String> dashboardIcons = [
    "assets/img_3.png",
    "assets/img_4.png",
    "assets/img_5.png",
    "assets/img_6.png",
    "assets/img_7.png",
    "assets/img_8.png",
    "assets/img_9.png",
    "assets/img_10.png",
  ];

  return Scaffold(
      body: Consumer<MainProvider>(
        builder: (context, value, child) {
          return Row(
            children: [
              Container(
                width: 160,
                color: Color(0xff161616),
                child: Consumer<MainProvider>(
                  builder: (context, value, child) {
                    return ListView(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(25),
                          child: Image.asset(
                            "assets/img_1.png",
                            height: 47,
                            width: 69,
                          ),
                        ),
                        Image.asset(
                          "assets/img_2.png",
                          height: 3,
                          fit: BoxFit.fill,
                        ),
                        SizedBox(height: 25),
                        Expanded(
                          child: ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: value.dashboardEnglishText.length,
                            itemBuilder: (context, index) {
                              bool isSelectedIndex =
                                  value.selectedIndex == index;
                              return InkWell(
                                child: Container(
                                  height: 40,
                                  margin: EdgeInsets.only(
                                    top: 10,
                                    left: 15,
                                    right: 15,
                                  ),
                                  decoration: BoxDecoration(
                                    color: isSelectedIndex == true
                                        ? Color(0xffF0E100)
                                        : Colors.black,
                                    borderRadius: BorderRadius.circular(6),
                                  ),

                                  child: Row(
                                    //mainAxisAlignment: value.language=="Arabic"?MainAxisAlignment.end:MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Image.asset(
                                          dashboardIcons[index],
                                          height: 15,
                                          width: 15,
                                          color: isSelectedIndex == true
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                      Text(
                                        overflow: TextOverflow
                                            .ellipsis, // Use ellipsis for clipping
                                        softWrap: false,
                                        maxLines: 3,
                                        value.dashboardEnglishText[index].tr(),
                                        style: TextStyle(
                                          fontSize: 10,
                                          color: isSelectedIndex == true
                                              ? Colors.black
                                              : Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                onTap: () {
                                  value.currentPage = 0;
                                  value.dashboardIndexItem(index);
                                },
                              );
                            },
                          ),
                        ),
                        InkWell(
                          child: Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.all(15),
                                child: Image.asset(
                                  "assets/img_16.png",
                                  height: 20,
                                  width: 20,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: false,
                                    maxLines: 3,
                                    "John Ebraham".tr(),
                                    style: TextStyle(
                                      color:
                                          value.selectedIndex ==
                                              value.dashboardPages.length - 1
                                          ? Color(0xffF0E100)
                                          : Colors.white,
                                      fontSize: 10,
                                    ),
                                  ),
                                  Text(
                                    "Asst.buyer".tr(),
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 5,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          onTap: () {
                            value.dashboardIndexItem(
                              value.dashboardPages.length - 1,
                            );
                          },
                        ),
                      ],
                    );
                  },
                ),
              ),

              Consumer<MainProvider>(
                builder: (context, value, child) {
                  return Expanded(
                    flex: 5,
                    child: SizedBox(
                      child: value.dashboardPages[value.selectedIndex],
                    ),
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
