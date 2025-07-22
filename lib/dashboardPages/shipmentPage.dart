import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider.dart';
import '../widgets.dart';

class Shipmentpage extends StatelessWidget {
  const Shipmentpage({super.key});

  @override
  Widget build(BuildContext context) { bool count = context.locale.languageCode == 'ar';
    final width = MediaQuery.of(context).size.width;
    int nofItem=3;
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
        builder: (context, value, child) { var horizontalScrollCT = ScrollController();
        var verticalScrollCT = ScrollController();

        int stylepagenumber =
              (value.shirts.length + value.itemsPerPage - 1) ~/
              value.itemsPerPage;
          return Expanded(
            child: Scrollbar( controller: horizontalScrollCT,
              thumbVisibility: true,
              thickness: 14,
              child: SingleChildScrollView(controller: horizontalScrollCT,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 8,
                  ),
                  child: Scrollbar(controller: verticalScrollCT,
                    scrollbarOrientation: ScrollbarOrientation.left,
                    thumbVisibility: true,

                    child: SingleChildScrollView(
                      controller: verticalScrollCT,
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      // horizontal scroll for 8 columns
                      child: Column(
                        children: [


                             Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Consumer<MainProvider>(
                                builder: (context, value, child) {
                                  return DataTable(horizontalMargin:0 ,
                                    headingRowHeight: 44,
                                    showCheckboxColumn: true, // header row height
                                    dataRowMinHeight: 30,
                                    dataRowMaxHeight: nofItem*33,
                                    border: TableBorder(
                                      horizontalInside: BorderSide(
                                        color: Colors.white,
                                        width: 2,
                                      ), // horizontal lines
                                      //verticalInside: BorderSide(color: Colors.red, width: 1),     // vertical lines
                                      // top: BorderSide(color: Colors.white, width: 1),
                                      // bottom: BorderSide(color: Colors.white, width: 1),
                                      // left: BorderSide(color: Colors.white, width: 1),
                                      // right: BorderSide(color: Colors.white, width: 1),
                                    ),

                                    columnSpacing: 0,

                                    dataRowColor: WidgetStateColor.resolveWith(
                                      (states) => Color(0xffFFF4ED),
                                    ),
                                    columns: [
                                      DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 50,

                                            decoration: BoxDecoration( border: Border.all(
                                              color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      // DataColumn(label: SizedBox(width: 10)),
                                      DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 50,
                                  child:Center(child: Text("SL".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 75,
                                            child:Center(child: Text("Cartoon\n\t\tFrom".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 75,
                                            child:Center(child: Text("Cartoon\n\t\t\t\tTo".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 75,
                                            child:Center(child: Text("\t\tNo.of\nCartoon".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            child:Center(child: Text("Cartoon Code".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            child:Center(child: Text("Bar Code".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 30,
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 75,
                                            child:Center(child: Text("Style".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 250,
                                            child:Center(child: Text("Fabric/Content".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 75,
                                            child:Center(child: Text("Colour".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 150,
                                            child:Center(child: Text("Age Group".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 150,
                                            child:Center(child: Text("Sizes".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 75,
                                            child:Center(child: Text("PKTS\n/CTN",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 75,
                                            child:Center(child: Text("TOTAL\nPKTS".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 100,
                                            child:Center(child: Text("CARTON\nDIMENTION".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 75,
                                            child:Center(child: Text("CBM",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 75,
                                            child:Center(child: Text("NW",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 75,
                                            child:Center(child: Text("GW",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 75,
                                            child:Center(child: Text("TTL\nNW".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 75,
                                            child:Center(child: Text("TTL\nGW".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 75,
                                            child:Center(child: Text("Cost".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 75,
                                            child:Center(child: Text("Value\nINR".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
                                            ),
                                          ),
                                        ),
                                      ),DataColumn(
                                        label: Align(
                                          alignment: Alignment.centerLeft,

                                          child: Container(
                                            height: 100,
                                            width: 75,
                                            child:Center(child: Text("Value\nUSD".tr(),style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12),),),
                                            decoration: BoxDecoration( border: Border.all(
                                                color: Colors.white,width: 1
                                            ),
                                              color: Color(0xffDEB9A3),
                                              borderRadius: BorderRadius.circular(12),
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
                                                          checkColor: Colors.black,
                                                          activeColor: Colors.orange,
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
                                              Container(
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
                                                  child: Text(
                                                    count==true?value.toArabicDigits("${value.start + index + 1}"):"${value.start + index + 1}",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Container(  decoration: BoxDecoration(
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
                                                child: Padding(
                                                  padding: const EdgeInsets.all(1),
                                                  child: Container(

                                                    width: 75,

                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Color(0xffCCCCCC),
                                                        width: 1,
                                                      ),
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(5),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '44',

                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Container(  decoration: BoxDecoration(
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
                                                child: Padding(
                                                  padding: const EdgeInsets.all(1),
                                                  child: Container(

                                                    width: 75,

                                                    decoration: BoxDecoration(
                                                      border: Border.all(
                                                        color: Color(0xffCCCCCC),
                                                        width: 1,
                                                      ),
                                                      color: Colors.white,
                                                      borderRadius:
                                                      BorderRadius.circular(5),
                                                    ),
                                                    child: Center(
                                                      child: Text(
                                                        '44',

                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Container(
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
                                                  child: Text(
                                                    "20",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Container(
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
                                                  child: Text(
                                                    "AG15",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Container(
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
                                                  child: Text(
                                                    "34253678",
                                                  ),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Container(height:nofItem*40,width:30,
                                                decoration: BoxDecoration(

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
                                                child: ListView.builder(
                                                 itemBuilder: (context, index) {
                                                   return Padding(
                                                     padding: const EdgeInsets.only(bottom: 1,top: 1),
                                                     child: ClipRRect(borderRadius: BorderRadius.circular(4),
                                                       child: Image.asset(width: 30,height: 29,
                                                         "assets/img_20.png",fit: BoxFit.fitHeight,
                                                       ),
                                                     ),
                                                   );
                                                 },itemCount: nofItem,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                                                ),
                                              ),
                                            ),DataCell(
                                              Container(height:nofItem*40,width:75,
                                                decoration: BoxDecoration(

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
                                                child: ListView.builder(
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 0),
                                                      child: Align(alignment:Alignment.center,child: Text("MME306")),
                                                    );
                                                  },itemCount: nofItem,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                                                ),
                                              ),
                                            ),DataCell(
                                              Container(height:nofItem*40,width:250,
                                                decoration: BoxDecoration(

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
                                                child: ListView.builder(
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 0),
                                                      child: Align(alignment:Alignment.center,child: Text("LADIES DRESS 100% RAYON WOVEN")),
                                                    );
                                                  },itemCount:nofItem,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                                                ),
                                              ),
                                            ),


                                            DataCell(
                                              Container(height:nofItem*40,width:75,
                                                decoration: BoxDecoration(

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
                                                child: ListView.builder(
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 0),
                                                      child:Align(alignment:Alignment.center,child: Text("green")),
                                                    );
                                                  },itemCount: nofItem,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Container(height:nofItem*40,width:150,
                                                decoration: BoxDecoration(

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
                                                child: ListView.builder(
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 0),
                                                      child: Align(alignment:Alignment.center,child: Text("Femail")),
                                                    );
                                                  },itemCount: nofItem,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Container(height:nofItem*40,width:150,
                                                decoration: BoxDecoration(

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
                                                child: ListView.builder(
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 0),
                                                      child: Align(alignment:Alignment.center,child: Text("S,M,XL,XXL")),
                                                    );
                                                  },itemCount: nofItem,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Container(height:nofItem*40,width:75,
                                                decoration: BoxDecoration(

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
                                                child: ListView.builder(
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 0),
                                                      child: Align(alignment:Alignment.center,child: Text("40")),
                                                    );
                                                  },itemCount: nofItem,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Container(height:nofItem*40,width:75,
                                                decoration: BoxDecoration(

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
                                                child: ListView.builder(
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 0),
                                                      child:Align(alignment:Alignment.center,child: Text("5467")),
                                                    );
                                                  },itemCount: nofItem,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Container(width:100,
                                                decoration: BoxDecoration(

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
                                                child: Center(child: Text("30x30x30")),


                                              ),
                                            ),
                                            DataCell(
                                              Container(width:75,
                                                decoration: BoxDecoration(

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
                                                child: Center(child: Text("2.356"))
                                              ),
                                            ),
                                            DataCell(
                                              Container(width:75,
                                                decoration: BoxDecoration(

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
                                                child: Center(child: Text("18.36"))
                                              ),
                                            ),
                                            DataCell(
                                              Container(width:75,
                                                decoration: BoxDecoration(

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
                                                child:Center(child: Text("20.3"))
                                              ),
                                            ),
                                            DataCell(
                                              Container(width:75,
                                                decoration: BoxDecoration(

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
                                                child: Center(child: Text("2.356"))
                                              ),
                                            ),
                                            DataCell(
                                              Container(width:75,
                                                decoration: BoxDecoration(

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
                                                child:Center(child: Text("2.355"))
                                              ),
                                            ),
                                            DataCell(
                                              Container(height:nofItem*40,width:75,
                                                decoration: BoxDecoration(

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
                                                child: ListView.builder(
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 0),
                                                      child: Align(alignment:Alignment.center,child: Text("₹300")),
                                                    );
                                                  },itemCount: nofItem,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Container(height:nofItem*40,width:75,
                                                decoration: BoxDecoration(

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
                                                child: ListView.builder(
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 0),
                                                      child: Align(alignment:Alignment.center,child: Text("₹23455")),
                                                    );
                                                  },itemCount: nofItem,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                                                ),
                                              ),
                                            ),
                                            DataCell(
                                              Container(height:nofItem*40,width:75,
                                                decoration: BoxDecoration(

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
                                                child: ListView.builder(
                                                  itemBuilder: (context, index) {
                                                    return Padding(
                                                      padding: const EdgeInsets.symmetric(vertical: 6,horizontal: 0),
                                                      child: Align(alignment:Alignment.center,child: Text("₹2345.65")),
                                                    );
                                                  },itemCount: nofItem,shrinkWrap: true,physics: NeverScrollableScrollPhysics(),
                                                ),
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

                          SizedBox(
                            height: 30,
                            width: MediaQuery.of(context).size.width * 0.8,
                            child: Row(
                              children: [
                                Text("Total items ${value.shirts.length}"),
                                SizedBox(width: 100),
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
                                  itemBuilder: (context, index) => Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 2),
                                    child: OutlinedButton(
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
