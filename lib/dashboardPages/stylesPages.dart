import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mm_exporters/provider.dart';
import 'package:mm_exporters/widgets.dart';

class StylesPages extends StatelessWidget {
  const StylesPages({super.key});

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
                  "Styles".tr(),
                  style: TextStyle(fontSize: width * 0.02, color: Colors.black),
                ),
                Consumer<MainProvider>(
                  builder: (context, value, child) {
                    return dashboardDropdown(
                      size: width * 0.16,
                      text: "mm Exporters",
                      selected: value.selectedDayItem,
                      items: value.mmExpoeters,
                      onChanged: (newValue) {
                        value.selectDay(newValue!);
                      },
                    );
                  },
                ),
                SizedBox(
                  width: 100,
                  height: 36,
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
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: SizedBox(
                  height: MediaQuery.of(context).size.width * 0.03,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(1),
                      backgroundColor: const Color(0xFF5B5EFC),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: Text(
                      'Create PO'.tr(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.01,
                      ),
                    ),
                  ),
                ),
              ),
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
                      'Create Style'.tr(),
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

          backgroundColor: const Color(0xffF7F7F7),

          body: Consumer<MainProvider>(
            builder: (context, value, child) {

              return Column(
                children: [
                  // Dropdowns below AppBar
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 16,
                    ),
                    child: Row(
                      children: [
                        dashboardDropdown(
                          size: width * 0.10,
                          text: "Seasons",
                          selected: value.selectedSeasonItem,
                          items: value.seasons,
                          onChanged: (newValue) {
                            value.selectedseason(newValue!);
                          },
                        ),
                        dashboardDropdown(
                          size: width * 0.08,
                          text: "Status".tr(),
                          selected: value.selectedStatusItem,
                          items: value.statuses,
                          onChanged: (newValue) {
                            value.selectedstatus(newValue!);
                          },
                        ),
                        dashboardDropdown(
                          size: width * 0.07,
                          text: "Colour".tr(),
                          selected: value.selectedColorItem,
                          items: value.colors,
                          onChanged: (newValue) {
                            value.selectedcolor(newValue!);
                          },
                        ),

                        SizedBox(width: MediaQuery.of(context).size.width * 0.10),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.01),
                          child: OutlinedButton(
                            onPressed: () {
                              // Your logic here
                            },
                            style: OutlinedButton.styleFrom(maximumSize:Size(
              MediaQuery.of(context).size.width * 0.08,
              40,
              ),
                              minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.02,
                                40,
                              ), // Width: 100, Height: 10
                              side: const BorderSide(
                                color: Color(0xffCFCFCF),
                              ), // Border color (optional)
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3), // Radius 2
                              ),
                              padding: EdgeInsets.all(
                                8,
                              ), // Ensures the button doesn't grow taller
                            ),
                            child: Text(
                              maxLines: 2,
                              'Get Cost'.tr(),
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: MediaQuery.of(context).size.width * 0.013,
                                color: Colors.blueGrey,
                              ), // Smaller font to fit the tiny height
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.01),
                          child: OutlinedButton(
                            onPressed: () {
                              // Your logic here
                            },
                            style: OutlinedButton.styleFrom(
                              maximumSize: Size(
                                MediaQuery.of(context).size.width * 0.13,
                                40,
                              ),minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.02,
                                40,
                              ), // Width: 100, Height: 10
                              side: const BorderSide(
                                color: Color(0xffCFCFCF),
                              ), // Border color (optional)
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3), // Radius 2
                              ),
                              padding: EdgeInsets.all(
                                8,
                              ), // Ensures the button doesn't grow taller
                            ),
                            child: Text(
                              maxLines: 1,
                              'Assign Designer'.tr(),
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: MediaQuery.of(context).size.width * 0.015,
                                color: Colors.blueGrey,
                              ), // Smaller font to fit the tiny height
                            ),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width*0.01),
                          child: OutlinedButton(
                            onPressed: () {
                              // Your logic here
                            },
                            style: OutlinedButton.styleFrom(
                              maximumSize: Size(
                                MediaQuery.of(context).size.width * 0.13,
                                40,
                              ), minimumSize: Size(
                                MediaQuery.of(context).size.width * 0.02,
                                40,
                              ), // Width: 100, Height: 10
                              side: const BorderSide(
                                color: Color(0xffCFCFCF),
                              ), // Border color (optional)
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3), // Radius 2
                              ),
                              padding: EdgeInsets.all(
                                8,
                              ), // Ensures the button doesn't grow taller
                            ),
                            child: Text(
                              maxLines: 1,
                              'Assign Supplier'.tr(),
                              style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                fontSize: MediaQuery.of(context).size.width * 0.015,
                                color: Colors.blueGrey,
                              ), // Smaller font to fit the tiny height
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Divider(thickness: 1, color: Color(0xffCFCFCF)),
                  Expanded(
                    child: Scrollbar(controller: horizontalScrollCT,
                      thumbVisibility: true,
                      thickness: 14,
                      child: SingleChildScrollView(controller: horizontalScrollCT,
physics: const BouncingScrollPhysics(),
scrollDirection: Axis.horizontal,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 0,horizontal: 8),
                          child: Scrollbar( controller: verticalScrollCT,
                            scrollbarOrientation: ScrollbarOrientation.left,
                            thumbVisibility: true,
                            child: SingleChildScrollView(controller: verticalScrollCT,
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                   // horizontal scroll for 8 columns
                              child: Column(
                                children: [
                                  Consumer<MainProvider>(
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
                                          DataColumn(label: SizedBox(width: 10)),
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
                                                "Status".tr(),
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
                                                "Reference".tr(),
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
                                                "Style No".tr(),
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
                                                "Garment".tr(),
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
                                                "Size Group".tr(),
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
                                                "Fabric".tr(),
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
                                                "Type".tr(),
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
                                                "GSM".tr(),
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
                                                "Count&\nConstruction".tr(),
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
                                                "Colour".tr(),
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
                                                "Size&Ratio".tr(),
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
                                                "Qty".tr(),
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
                                                "Lead Time".tr(),
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
                                                "EDD".tr(),
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
                                                "Price/Unit".tr(),
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
                                                "Cost of Style".tr(),
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
                                                "Designer".tr(),
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
                                                "Supplier".tr(),
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
                                                "Note".tr(),
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                        rows: List.generate(
                                          value
                                              .getCurrentPageItems(value.currentPage,10)
                                              .length,
                                          (index) {
                                            return DataRow(
                                              cells: [
                                                DataCell(
                                                  Padding(
                                                    padding: const EdgeInsets.all(25),
                                                    child: Center(
                                                      child: SizedBox(
                                                        width: 10,
                                                        child: Consumer<MainProvider>(
                                                          builder: (context,value,child) {
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
                                                              value: value.checkIndex.contains(index)?true:false,
                                                              onChanged: (selected) {
                                                                value.stylePageCheck(index);
                                                              },
                                                            );
                                                          }
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Padding(
                                                    padding: const EdgeInsets.all(20),
                                                    child: Center(
                                                      child: Text(
                                                        count==true?value.toArabicDigits("${value.start + index + 1}"):"${value.start + index + 1}",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(child: Text(value.statuses.last)),
                                                ),
                                                DataCell(
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: SizedBox(
                                                      width: 100,
                                                      child: Image.asset(
                                                        "${value.shirts[value.start + index]}",
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      "R35t4643 ${value.start + index + 1}",
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      "T-SHiRT ${value.start + index + 1}",
                                                    ),
                                                  ),
                                                ),
                                                DataCell(Center(child: Text("Men's"))),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      style: TextStyle(),
                                                      "100% COTTON160 GSM \n SJ BIO WASH",
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      style: TextStyle(),
                                                      "Knitted",
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      style: TextStyle(),
                                                      "360",
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      style: TextStyle(),
                                                      "30's",
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      style: TextStyle(),
                                                      "Ramadan",
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      style: TextStyle(),
                                                      "Green",
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      style: TextStyle(),
                                                      "S,M,XL,XLL\n1:2:1:2:1",
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      style: TextStyle(),
                                                      "1500 pcs",
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      style: TextStyle(),
                                                      "POKK23545",
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      style: TextStyle(),
                                                      "12/03/2025",
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      style: TextStyle(),
                                                      "120 days",
                                                    ),
                                                  ),
                                                ),DataCell(
                                                  Center(
                                                    child: Text(
                                                      style: TextStyle(),
                                                      "12/03/2025",
                                                    ),
                                                  ),
                                                ),DataCell(
                                                  Center(
                                                    child: Text(
                                                      style: TextStyle(),
                                                      "\$3",
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      style: TextStyle(),
                                                      "\$33444",
                                                    ),
                                                  ),
                                                ),DataCell(
                                                  Center(
                                                    child: Text(
                                                      style: TextStyle(),
                                                      "Rashidali",
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  Center(
                                                    child: Text(
                                                      style: TextStyle(),
                                                      "mm Exporters",
                                                    ),
                                                  ),
                                                ),
                                                DataCell(
                                                  SizedBox(width:300,
                                                    child: Padding(
                                                      padding: const EdgeInsets.all( 4),
                                                      child: SingleChildScrollView(
                                                        child: Text(maxLines: 7,

                                                          "fwef wegfe wgtr yhtj tujt yj kmyg ytk jiyt kmh bgm jhg ghjg hjkf wefw egfe wgt ryhtj tujty jkmyg ytkji ytkm hbgmj hg ghjgh jkfwe wegfe wgtryhtj tujty jkmyg ytkji ytkm hbgmj hg ghjgh jkmgk,mh gkhugk,m bj,ku jgymj gkmj jngy jm gymj fgjn gymjyg jng vynj vgjn fjn",
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
                                  ),SizedBox(
                                    height: 30,
                                    width: MediaQuery.of(context).size.width * 0.8,
                                    child: Row(
                                      children: [
                                        Text("Total:${value.shirts.length}"),
                                        SizedBox(width: 100),
                                        SizedBox(
                                          height: 30,
                                          width: 30,
                                          child: Center(
                                            child: IconButton(
                                              onPressed: () {
                                                value.getCurrentPageItems(
                                                  value.currentPage >= 1 ? value.currentPage - 1 : 0,
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
                  ),


                ],
              );
            },
          ),
        );

  }
}
// Scrollbar( controller: horizontalScrollCT,
// thumbVisibility: true,
// thickness: 14,
// child: SingleChildScrollView( controller: horizontalScrollCT,
// physics: const BouncingScrollPhysics(),
// scrollDirection: Axis.horizontal,