import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dashboardPages/dash_board_page.dart';
import 'dashboardPages/ledger_page.dart';
import 'dashboardPages/logout_page.dart';
import 'dashboardPages/po_page.dart';
import 'dashboardPages/samples_page.dart';
import 'dashboardPages/shipment_page.dart';
import 'dashboardPages/staff_management_page.dart';
import 'dashboardPages/styles_pages.dart';
import 'dashboardPages/user_management_page.dart';

class MainProvider extends ChangeNotifier {
  DateTimeRange? selectedDateRange;
  int selectedIndex = 0;

  List dashboardPages = [
    DashBoardPage(),
    StylesPages(),
    SamplesPage(),
    ShipmentPage(),
    PoPage(),
    LedgerPage(),
    StaffManagementPage(),
    UserManagementPage(),
    LogoutPage(),
  ];
  String language="Arabic";
  String selectedDayItem = "mm Exporters";
  String selectedSeasonItem = "Seasons";
  String selectedYearItem = "Years";
  String selectedStatusItem = "Status";
  String selectedColorItem = "Colour";
  String selectedUserType = "Supplier";
  List<String> dashboardEnglishText = [
    'Dashboard',
    'Styles',
    'Samples',
    'Shipment',
    'PO',
    'Ledger',
    'Staff Management',
    'User Management',
  ];  List<String> dashboardArabicText = [
    "لوحة التحكم",
    "الأنماط",
    "العينات",
    "الشحنات",
    "قائمة أوامر الشراء",
    "دفتر الأستاذ",
    "إدارة الموظفين",
    "إدارة المستخدمين",
  ];

  final List<String> mmExpoeters = [
    "mm Exporters",
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
    'Sunday',
  ] ;
  final List<String> userType = [
    "Supplier",
    "Assistant Buyers",
    "Designers"
  ];

  final List<String> seasons = [
    "Seasons",
    "Regular",
    "Ramadan",
    "Winter",
    "National day",
    "Inner wear",
    "Founding Day",
    "Collection",
  ];
  final List<String> years = [
    "Years",
    "2025",
    "2024",
    "2023",
    "2022",
    "2021",
];

  final List<String> cardIcons = [
    "assets/img_12.png",
    "assets/img_12.png",
    "assets/img_12.png",
    "assets/img_13.png",
    "assets/img_14.png",
    "assets/img_15.png",
    "assets/img_12.png",
  ];
 final List<String> cardTitle = [
    "100",
    "100",
    "100",
    "300",
    "400",
    "567",
    "756",
  ];
  final List<String> statuses = [
    "Status",
    "New Style",
    "Cutting",
    "Printing",
    "Desighning",
    "Stitching",
    "Ironing",
  ];
  final List<String> colors = [
    "Colour",
    "red",
    "yellow",
    "blue",
    "gree",
    "black",
    "brown",
  ];
  final List<String> cardSubtitle = [
    "Sampling",
    "Costing",
    "Production",
    "Ready To Dispatch",
    "Dispatched",
    "Receieved",
    "Cancelled",
  ];
  final List<String> shirts = [
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
    "assets/shirt1.png",
    "assets/shirt2.png",
  ];
  int currentPage = 0;
  int start = 0;
  int end = 10;
  String toArabicDigits(String input) {
    const westernToArabicDigits = {
      '0': '٠',
      '1': '١',
      '2': '٢',
      '3': '٣',
      '4': '٤',
      '5': '٥',
      '6': '٦',
      '7': '٧',
      '8': '٨',
      '9': '٩',
    };

    return input.split('').map((char) => westernToArabicDigits[char] ?? char).join();
  }

  List<int> checkIndex=[];
  List<String> getCurrentPageItems(int selectedPage,int itemsPerPage) {
    currentPage = selectedPage;
    start = currentPage * itemsPerPage;
    end = start + itemsPerPage;
    end = end > shirts.length ? shirts.length : end;
    notifyListeners();
    return shirts.sublist(start, end);
  }

  void changeLanguageSelection(String selectedlanguage) {
    language = selectedlanguage;
    notifyListeners();
  }

  void selectDay(String selected) {
    selectedDayItem = selected;
    notifyListeners();
  }

   void selectedseason(String selected) {
    selectedSeasonItem = selected;
    notifyListeners();
  }

  void selectedYear(String selected) {
    selectedYearItem = selected;
    notifyListeners();
  }

  void selectedstatus(String selected) {
    selectedStatusItem = selected;
    notifyListeners();
  }

  selectedcolor(String selected) {
    selectedColorItem = selected;
    notifyListeners();
  }
  stylePageCheck(int selected){
    if(checkIndex.contains(selected)){
      checkIndex.remove(selected);notifyListeners();
    }else {
      checkIndex.add(selected);notifyListeners();
    }

    notifyListeners();
  }
  dashboardIndexItem(int index){
    selectedIndex=index;
    notifyListeners();
  }
  Future<void> selectDateRange(BuildContext context) async {
    final DateTimeRange? picked = await showDateRangePicker(
      context: context,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialDateRange: selectedDateRange,
    );

    if (picked != null) {

        selectedDateRange = picked;

    }notifyListeners();
  }
  String get formattedDateRange {
    if (selectedDateRange == null) return "Select Date Range";
    final formatter = DateFormat('dd/MM/yyyy');
    return '${formatter.format(selectedDateRange!.start)}-${formatter.format(selectedDateRange!.end)}';
  }
  selectedUserTypeDrop(String selected)  {
    selectedUserType=selected;notifyListeners();
  }

}
