import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mm_exporters/login_page.dart';

class LanguageChange extends StatelessWidget {
  const LanguageChange({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FittedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Login Modules",
                style: TextStyle(
                  color: Color(0xff002060),
                  fontWeight: FontWeight.w700,
                  fontSize: 20,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Color(0xff16852A),
                    fixedSize: Size(700, 25), // Width: 200, Height: 100
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ), // Rounded corners
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    "Super Admin",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              Text(
                "Production / Supplier Modules",
                style: TextStyle(
                  color: Color(0xff8D8D8D),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FittedBox(
                child: Row(
                  children: [
                    moduletextbuttons(
                      context: context,
                      width: 345,
                      widget: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Merchandiser"),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: VerticalDivider(
                              width: 1,
                              color: Color(0xff8D8D8D),
                            ),
                          ),
                          Text("BOM"),
                        ],
                      ),
                      onPressed: () {},
                    ),
                    moduletextbuttons(
                      context: context,
                      width: 165,
                      widget: Text("Store v.1"),
                      onPressed: () {},
                    ),
                    moduletextbuttons(
                      context: context,
                      width: 165,
                      widget: Text("Store v.2"),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              FittedBox(
                child: Row(
                  children: [
                    moduletextbuttons(
                      context: context,
                      width: 350,
                      widget: Text("Cutting"),
                      onPressed: () {},
                    ),
                    moduletextbuttons(
                      context: context,
                      width: 350,
                      widget: Text("Production"),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              FittedBox(
                child: Row(
                  children: [
                    moduletextbuttons(
                      context: context,
                      width: 350,
                      widget: Text("Finishing"),
                      onPressed: () {},
                    ),
                    moduletextbuttons(
                      context: context,
                      width: 350,
                      widget: Text("Accounts Section"),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
              Text(
                "Libsi Markah",
                style: TextStyle(
                  color: Color(0xff8D8D8D),
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                ),
              ),
              FittedBox(
                child: Row(
                  children: [
                    moduletextbuttons(
                      context: context,
                      width: 350,
                      widget: Text("Arabic Asst Buyer"),
                      onPressed: () {
                        context.setLocale(Locale('ar'));
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                    ),
                    moduletextbuttons(
                      context: context,
                      width: 350,
                      widget: Text("Asst Buyer"),
                      onPressed: () {
                        context.setLocale(Locale('en'));
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                    ),
                  ],
                ),
              ),
              FittedBox(
                child: Row(
                  children: [
                    moduletextbuttons(
                      context: context,
                      width: 350,
                      widget: Text("Designer"),
                      onPressed: () {},
                    ),
                    moduletextbuttons(
                      context: context,
                      width: 350,
                      widget: Text("Supplier"),
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget moduletextbuttons({
  required BuildContext context,
  required double width,
  required Widget widget,
  required VoidCallback onPressed,
}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextButton(
      style: TextButton.styleFrom(
        backgroundColor: Color(0xffF7F7F7),
        fixedSize: Size(width, 25), // Width: 200, Height: 100
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Rounded corners
          side: const BorderSide(
            color: Colors.blue, // Border color
            width: 1, // Border width
          ),
        ),
      ),
      onPressed: onPressed,
      child: widget,
    ),
  );
}