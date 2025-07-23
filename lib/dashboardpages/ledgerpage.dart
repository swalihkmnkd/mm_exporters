import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider.dart';
import '../widgets.dart';

class LedgerPage extends StatelessWidget {
  const LedgerPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool count = context.locale.languageCode == 'ar';
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 30,
              width: 100,
              child: OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  maximumSize: Size(
                    MediaQuery.of(context).size.width * 0.20,
                    40,
                  ),
                  minimumSize: Size(
                    MediaQuery.of(context).size.width * 0.02,
                    40,
                  ), // Width: 100, Height: 10
                  side: BorderSide(width: 1, color: Colors.deepPurple),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // Radius 2
                  ),
                  padding: EdgeInsets.all(
                    8,
                  ), // Ensures the button doesn't grow taller
                ),
                onPressed: () {},
                label: Text(
                  "Search".tr(),
                  style: TextStyle(color: Colors.white),
                ),
                icon: Icon(Icons.search, color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(2.0),
            child: SizedBox(
              height: 30,
              width: 110,
              child: ElevatedButton.icon(
                style: OutlinedButton.styleFrom(
                  maximumSize: Size(
                    MediaQuery.of(context).size.width * 0.20,
                    40,
                  ),
                  minimumSize: Size(
                    MediaQuery.of(context).size.width * 0.02,
                    40,
                  ), // Width: 100, Height: 10
                  side: BorderSide(color: Colors.deepPurple),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // Radius 2
                  ),
                  padding: EdgeInsets.all(
                    8,
                  ), // Ensures the button doesn't grow taller
                ),
                onPressed: () {},
                label: Text(
                  "Reset".tr(),
                  style: TextStyle(color: Colors.deepPurple),
                ),
                icon: Icon(Icons.refresh, color: Colors.deepPurple),
              ),
            ),
          ),
        ],
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
                "Ledger".tr(),
                style: TextStyle(fontSize: width * 0.02, color: Colors.black),
              ),
            ),
            Consumer<MainProvider>(
              builder: (context, value, child) {
                return dashboardDropdown(
                  size: MediaQuery.of(context).size.width * 0.16,
                  text: "mm Exporters",
                  selected: value.selectedDayItem,
                  items: value.mmExpoeters,
                  onChanged: (newvalue) {
                    value.selectday(newvalue.toString());
                  },
                );
              },
            ),

            Consumer<MainProvider>(
              builder: (context, value, child) {
                return OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    maximumSize: Size(
                      MediaQuery.of(context).size.width * 0.20,
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
                  onPressed: () {
                    value.selectDateRange(context);
                  },
                  icon: Text(
                    value.formattedDateRange,
                    style: TextStyle(color: Colors.black54, fontSize: 10),
                  ),
                  label: Icon(Icons.date_range, color: Colors.indigo),
                );
              },
            ),
          ],
        ),
      ),
      body: Consumer<MainProvider>(
        builder: (context, value, child) {
          return Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 0,
                    horizontal: 8,
                  ),
                  child: SingleChildScrollView(
                    scrollDirection:
                        Axis.horizontal, // horizontal scroll for 8 columns
                    child: SingleChildScrollView(
                      scrollDirection:
                          Axis.vertical, // vertical scroll for 12 rows
                      child: Consumer<MainProvider>(
                        builder: (context, value, child) {
                          return DataTable(
                            horizontalMargin: 0,
                            headingRowHeight: 30,
                            dataRowMinHeight: 30,
                            dataRowMaxHeight: 30,

                            // header row height
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
                              DataColumn(label: tableHeading(text: "SL".tr())),
                              DataColumn(
                                label: tableHeading(text: "Date".tr()),
                              ),
                              DataColumn(
                                label: tableHeading(text: "Particulas".tr()),
                              ),
                              DataColumn(
                                label: tableHeading(text: "Receipt".tr()),
                              ),
                              DataColumn(
                                label: tableHeading(text: "Payment".tr()),
                              ),
                            ],
                            rows: [
                              ...List.generate(3, (index) {
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
                                          count == true
                                              ? value.toArabicDigits(
                                                  "${index + 1}",
                                                )
                                              : "${index + 1}",
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Center(
                                        child: Text("${index + 1}/02/2025"),
                                      ),
                                    ),
                                    DataCell(
                                      SizedBox(
                                        width: 350,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8,
                                          ),
                                          child: Text("Advance"),
                                        ),
                                      ),
                                    ),
                                    DataCell(
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: SizedBox(
                                          width: 200,
                                          child: Text(""),
                                        ),
                                      ),
                                    ),
                                    DataCell(Center(child: Text("₹ 5000"))),
                                  ],
                                );
                              }),
                              DataRow(
                                color: WidgetStateProperty.all<Color>(
                                  Color(0xffEDF3FF),
                                ),
                                cells: [
                                  const DataCell(
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const DataCell(
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const DataCell(
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  const DataCell(
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '₹ 5000000',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          );
                        },
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
