import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mm_exporters/provider.dart';
import 'package:mm_exporters/widgets.dart';

class UserManagementPage extends StatelessWidget {
  const UserManagementPage({super.key});

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
            Text(
              "User Management".tr(),
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
                  'Create User'.tr(),
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

              Expanded(
                child: SingleChildScrollView(
                  scrollDirection:
                      Axis.vertical, // vertical scroll for 12 rows
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Align(alignment: Alignment.centerLeft,
                          child: dashboardDropdown(
                            size: width * 0.15,
                            text: "Supplier",
                            selected: value.selectedUserType,
                            items: value.userType,
                            onChanged: (newValue) {
                              value.selectedUserTypeDrop(newValue!);
                            },
                          ),
                        ),
                      ),
                      Divider(thickness: 1, color: Color(0xffCFCFCF)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 0,
                          horizontal: 8,
                        ),
                        child: Consumer<MainProvider>(
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
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 8.0,
                                    ),
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
                                      "Name".tr(),
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
                                      "Phone Number".tr(),
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
                                      "Edit".tr(),
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
                                      "Delete".tr(),
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
                                           count==true? value.toArabicDigits("${value.start + index + 1}"):"${value.start + index + 1}",
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        SizedBox(width:MediaQuery.of(context).size.width*0.45,child: Text("mmExpotrersName")),
                                      ),
                                      DataCell(
                                        Center(
                                          child: Text(
                                            "3453455767${value.start + index + 1}",
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Center(
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.mode_edit_outlined,
                                              color: Colors.blue,
                                              size: 15,
                                            ),
                                          ),
                                        ),
                                      ),
                                      DataCell(
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                            horizontal: 8.0,
                                          ),
                                          child: IconButton(
                                            onPressed: () {},
                                            icon: Icon(
                                              Icons.delete_outline_sharp,
                                              color: Colors.red,
                                              size: 15,
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
                      ),pageIndicator(list: value.shirts, itemsPerPage:10)
                    ],
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
