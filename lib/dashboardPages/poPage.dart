import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mm_exporters/provider.dart';


class PoPage extends StatelessWidget {
  const PoPage({super.key});

  @override
  Widget build(BuildContext context) {  var horizontalScrollCT = ScrollController(); bool count = context.locale.languageCode == 'ar';
  var verticalScrollCT = ScrollController();


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
          Text(
            "PO List".tr(),
            style: TextStyle(fontSize: width * 0.02, color: Colors.black),
          ),
          SizedBox(width: 20),
          SizedBox(
            width: 200,
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

    backgroundColor: const Color(0xffF7F7F7),

    body: Consumer<MainProvider>(
      builder: (context, value, child) {
        int stylepagenumber =
            (value.shirts.length + value.itemsPerPage - 1) ~/
                value.itemsPerPage;
        return Column(
          children: [

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8,horizontal: 8),
                child: Scrollbar(controller: horizontalScrollCT,
                  thumbVisibility: true,
                  thickness: 14,
                  child: SingleChildScrollView(
                    controller: horizontalScrollCT,
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,// horizontal scroll for 8 columns
                    child: Scrollbar(  controller: verticalScrollCT,
                      scrollbarOrientation: ScrollbarOrientation.left,
                      thumbVisibility: true,
                      child: SingleChildScrollView(
                        controller: verticalScrollCT,
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.vertical,// vertical scroll for 12 rows
                        child: Consumer<MainProvider>(
                          builder: (context, value, child) {
                            return DataTable(horizontalMargin: 0,
                              headingRowHeight: 48,
                              showCheckboxColumn: true, // header row height
                              dataRowMinHeight: 30,
                              dataRowMaxHeight: 80,

                              border: TableBorder.all(
                                color: Color(0xffF7F7F7),
                                width: 1,
                              ),
                              columnSpacing: 0,
                              headingRowColor: WidgetStateColor.resolveWith(
                                    (states) => Color(0xffEDF3FF),
                              ),
                              dataRowColor: WidgetStateColor.resolveWith(
                                    (states) => Colors.white,
                              ),
                              columns: [

                                DataColumn(
                                  label: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 15,
                                    ),
                                    child: Center(
                                      child: Text(
                                        "SL".tr(),
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
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
                                      "PO Number".tr(),
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
                                      "PO Date".tr(),
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
                                      "Season".tr(),
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
                                      "PO Status".tr(),
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
                                      "Cost".tr(),
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
                                      "Exporter".tr(),
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
                                    cells: [
                                      DataCell(
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Center(
                                            child: Text(
                                              count==true?value.toArabicDigits("${index+1}"):"${index+1}",
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: Center(
                                            child: Text(
                                              "LM010/24-25 DTD",
                                            ),
                                          ),
                                        ),
                                      ),

                                      DataCell(
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: SizedBox(
                                            width: 100,
                                            child: Text(
                                              "5/05/2025",
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Center(
                                          child: Text(
                                            "R21DG691-R21DG691-R21DG691-R21DG691",
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Center(
                                          child: Text(
                                            "Ramadan",
                                          ),
                                        ),
                                      ),

                                      DataCell(
                                        Center(
                                          child: Text(
                                            style: TextStyle(),
                                            "Complete",
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Center(
                                          child: Text(
                                            style: TextStyle(),
                                            "₹34,66,778",
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Center(
                                          child: Text(
                                            style: TextStyle(),
                                            "4F TRADING",
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
  }
}
