import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider.dart';
import '../widgets.dart';

class ShipmentPage extends StatelessWidget {
  const ShipmentPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool count = context.locale.languageCode == 'ar';
    final width = MediaQuery.of(context).size.width;
    int nofItem = 3;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        shape: const Border(
          bottom: BorderSide(width: 1, color: Color(0xffCFCFCF)),
        ),
        elevation: 1,
        title: Row(
          children: [
            Text(
              "Shipment".tr(),
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: SizedBox(
              height: MediaQuery.of(context).size.width * 0.03,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.all(3),
                  backgroundColor: const Color(0xFFF0E100),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text(
                  'Received'.tr(),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: MediaQuery.of(context).size.width * 0.01,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: Consumer<MainProvider>(
        builder: (context, value, child) {
          var horizontalScrollCT = ScrollController();
          var verticalScrollCT = ScrollController();


          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0,
                horizontal: 8,
              ),
              child: Scrollbar(
                controller: verticalScrollCT,
                scrollbarOrientation: ScrollbarOrientation.left,
                thumbVisibility: true,

                child: SingleChildScrollView(
                  controller: verticalScrollCT,
                  physics: const BouncingScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  // horizontal scroll for 8 columns
                  child: Column(
                    children: [
                      Scrollbar(controller: horizontalScrollCT,
                        thumbVisibility: true,
                        thickness: 14,
                        child: SingleChildScrollView( controller: horizontalScrollCT,
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Consumer<MainProvider>(
                              builder: (context, value, child) {
                                return DataTable(
                                  horizontalMargin: 0,
                                  headingRowHeight: 44,
                                  showCheckboxColumn: true, // header row height
                                  dataRowMinHeight: 30,
                                  dataRowMaxHeight: nofItem * 33,
                                  border: TableBorder(
                                    horizontalInside: BorderSide(
                                      color: Colors.white,
                                      width: 2,
                                    ),
                                  ),

                                  columnSpacing: 0,

                                  dataRowColor: WidgetStateColor.resolveWith(
                                    (states) => Color(0xffFFF4ED),
                                  ),
                                  columns: [
                                    DataColumn(
                                      label: dataColumnShipment(width: 50),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 50,
                                        text: "SL".tr(),
                                      ),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 75,
                                        text: "Cartoon\n\t\tFrom".tr(),
                                      ),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 75,
                                        text: "Cartoon\n\t\t\t\tTo".tr(),
                                      ),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 100,
                                        text: "\t\tNo.of\nCartoon".tr(),
                                      ),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 100,
                                        text: "Cartoon Code".tr(),
                                      ),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 100,
                                        text: "Bar Code".tr(),
                                      ),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(width: 30),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 75,
                                        text: "Style".tr(),
                                      ),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 250,
                                        text: "Fabric/Content".tr(),
                                      ),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 75,
                                        text: "Colour".tr(),
                                      ),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 150,
                                        text: "Age Group".tr(),
                                      ),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 150,
                                        text: "Sizes".tr(),
                                      ),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 75,
                                        text: "PKTS\n/CTN",
                                      ),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 75,
                                        text: "TOTAL\nPKTS".tr(),
                                      ),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 100,
                                        text: "CARTON\nDIMENTION".tr(),
                                      ),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 75,
                                        text: "CBM",
                                      ),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 75,
                                        text: "NW",
                                      ),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 75,
                                        text: "GW",
                                      ),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 75,
                                        text: "TTL\nNW".tr(),
                                      ),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 75,
                                        text: "TTL\nGW".tr(),
                                      ),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 75,
                                        text: "Cost".tr(),
                                      ),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 75,
                                        text: "Value\nINR".tr(),
                                      ),
                                    ),
                                    DataColumn(
                                      label: dataColumnShipment(
                                        width: 75,
                                        text: "Value\nUSD".tr(),
                                      ),
                                    ),
                                  ],
                                  rows: List.generate(
                                    value
                                        .getCurrentPageItems(value.currentPage,10)
                                        .length,
                                    (index) {
                                      return (DataRow(
                                        cells: [
                                          DataCell(
                                            Container(
                                              width: 50,
                                              decoration: BoxDecoration(
                                                color: Color(0xffFFF4ED),
                                                border: Border(
                                                  top: BorderSide(
                                                    color: Colors.white,
                                                    width: 2,
                                                  ),
                                                  bottom: BorderSide(
                                                    color: Color(0xffDEB9A3),
                                                    width: 2,
                                                  ),
                                                ),
                                              ),
                                              child: Center(
                                                child: SizedBox(
                                                  width: 10,
                                                  child: Consumer<MainProvider>(
                                                    builder: (context, value, child) {
                                                      return Checkbox(
                                                        shape: RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadiusGeometry.circular(
                                                                3,
                                                              ),
                                                          side: BorderSide(
                                                            width: 0.5,
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                        checkColor:
                                                            Colors.black,
                                                        activeColor:
                                                            Colors.orange,
                                                        value:
                                                            value.checkindex
                                                                 .contains(index)
                                                            ? true
                                                            : false,
                                                        onChanged: (selected) {
                                                          value.stylePageCheck(
                                                            index,
                                                          );
                                                        },
                                                      );
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 50,
                                              singleText: count == true
                                                  ? value.toArabicDigits(
                                                      "${value.start + index + 1}",
                                                    )
                                                  : "${value.start + index + 1}",
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 77,
                                              isWhiteBox: true,
                                              whiteBoxText: '44',
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 77,
                                              isWhiteBox: true,
                                              whiteBoxText: '44',
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 100,
                                              singleText: "20",
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 100,
                                              singleText: "AG15",
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 100,
                                              singleText: "34253678",
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 30,
                                              isImage: true,
                                              isList: true,
                                              image: "assets/img_20.png",
                                              noOfItem: 3,
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 75,
                                              isList: true,
                                              noOfItem: 3,
                                              listText: "MME306",
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 250,
                                              isList: true,
                                              listText:
                                                  "LADIES DRESS 100% RAYON WOVEN",
                                              noOfItem: 3,
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 75,
                                              isList: true,
                                              noOfItem: 3,
                                              listText: "green",
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 150,
                                              isList: true,
                                              listText: "Femail",
                                              noOfItem: 3,
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 150,
                                              isList: true,
                                              listText: "S,M,XL,XXL",
                                              noOfItem: 3,
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 75,
                                              isList: true,
                                              noOfItem: 3,
                                              listText: "40",
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 75,
                                              noOfItem: 3,
                                              isList: true,
                                              listText: "5467",
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 100,
                                              singleText: "30x30x30",
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 75,
                                              singleText: "2.356",
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 75,
                                              singleText: "18.36",
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 75,
                                              singleText: "20.3",
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 75,
                                              singleText: "2.356",
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 75,
                                              singleText: "2.355",
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 75,
                                              isList: true,
                                              listText: "₹300",
                                              noOfItem: 3,
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 75,
                                              isList: true,
                                              noOfItem: 3,
                                              listText: "₹23455",
                                            ),
                                          ),
                                          DataCell(
                                            dataRowShipment(
                                              width: 75,
                                              isList: true,
                                              noOfItem: 3,
                                              listText: "₹2345.65",
                                            ),
                                          ),
                                        ],
                                      ));
                                    },
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),

                      pageIndicator(list: value.shirts, itemsPerPage: 10),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
