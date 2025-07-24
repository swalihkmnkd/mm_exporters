import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mm_exporters/widgets.dart';
import 'package:provider/provider.dart';

import '../provider.dart';

class SamplesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) { bool count = context.locale.languageCode == 'ar';
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shape: const Border(
          bottom: BorderSide(width: 1, color: Color(0xffCFCFCF)),
        ),
        elevation: 1,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 20),
              child: Text(
                "Samples".tr(),
                style: TextStyle(fontSize: width * 0.02, color: Colors.black),
              ),
            ),

            SizedBox(
              width: width * 0.4,
              height: 30,
              child: TextField(
                style: const TextStyle(fontSize: 12),
                decoration: InputDecoration(
                  isDense: true,
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  hintText: "Search".tr(),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/img_18.png"),
                  ),
                  hintStyle: const TextStyle(fontSize: 12, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1),
                    borderSide: const BorderSide(color: Color(0xffCFCFCF)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1),
                    borderSide: const BorderSide(color: Color(0xffCFCFCF)),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(1),
                    borderSide: const BorderSide(color: Colors.grey),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Consumer<MainProvider>(
        builder: (context, value, child) {

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 8,
              ),
              child: SingleChildScrollView(
                scrollDirection:
                    Axis.vertical, // vertical scroll for 12 rows
                child: Column(
                  children: [
                    Consumer<MainProvider>(
                      builder: (context, value, child) {
                        return DataTable(horizontalMargin: 0,
                          headingRowHeight: 30,
                          // header row height
                          dataRowMaxHeight: 30,
                          dataRowMinHeight: 30,

                          border: TableBorder.all(
                            color: Color(0xffF7F7F7),
                            width: 1,
                          ),
                          columnSpacing: 0,
                          headingRowColor: WidgetStateColor.resolveWith((
                            states,
                          ) {
                            return Color(0xffEDF3FF);
                          }),
                          dataRowColor: WidgetStateColor.resolveWith(
                            (states) => Colors.white,
                          ),
                          columns: [
                            DataColumn(
                              label: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text(
                                  "SL".tr(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                child: Text(
                                  "Date".tr(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                child: Text(
                                  "Tracking Number".tr(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                child: Text(
                                  "Styles".tr(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                child: Text(
                                  "Document".tr(),
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            DataColumn(
                              label: Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                  vertical: 5,
                                ),
                                child: Text(
                                  "",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                          rows: List.generate(
                            value
                                .getCurrentPageItems(value.currentPage)
                                .length,
                            (index) {
                              return DataRow(
                                color:
                                    WidgetStateProperty.resolveWith<Color?>((
                                      Set<WidgetState> states,
                                    ) {
                                      return index.isEven
                                          ? Colors.white
                                          : Colors.grey[200];
                                    }),
                                cells: [
                                  DataCell(
                                    Center(
                                      child: Text(
                                        count==true?value.toArabicDigits("${value.start + index + 1}"):"${value.start + index + 1}",
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        "${value.start + index + 1}/02/2025",
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        "KLKJK5678${value.start + index + 1}",
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: SizedBox(
                                        width: 210,
                                        child: Text("STYL 123 , STYL 124"),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        "filename.pdf".tr(),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Padding(
                                      padding:  EdgeInsets.all(
                                        4
                                      ),
                                      child: ElevatedButton.icon(
                                        onPressed: () {},
                                        label: Image.asset(
                                          "assets/img_19.png",
                                          height: 15,
                                          width: 15,
                                        ),
                                        icon: Text(
                                          "Download".tr(),
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                        style: ButtonStyle(
                                          backgroundColor:
                                              WidgetStateProperty.all<Color>(
                                                Color(0xff5B5EFC),
                                              ),
                                          shape:
                                              WidgetStateProperty.all<
                                                RoundedRectangleBorder
                                              >(
                                                RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                        3,
                                                      ), // Rounded corners
                                                ),
                                              ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: 30,

                      child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          SizedBox(
                            height: 30,
                            width: 30,
                            child: Center(
                              child: IconButton(
                                onPressed: () {
                                  value.getCurrentPageItems(
                                    value.currentPage >= 1
                                        ? value.currentPage - 1
                                        : 0,
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
                            itemCount: stylepagenumber,
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
                                value.getCurrentPageItems(index);
                              },
                              child: Text(count==true?value.toArabicDigits("${index + 1}"):"${index + 1}"),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              value.getCurrentPageItems(
                                value.currentPage <= stylepagenumber - 2
                                    ? value.currentPage + 1
                                    : stylepagenumber - 1,
                              );
                            },
                            icon: Icon(Icons.arrow_forward, size: 20),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
