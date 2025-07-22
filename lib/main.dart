import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mm_exporters/dashboard.dart';
import 'package:mm_exporters/provider.dart';
import 'package:provider/provider.dart';

import 'languagechange.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
      options: FirebaseOptions(
        apiKey: "",
        appId: "",
        messagingSenderId: "",
        projectId: "mm-exporters",
      ),
    );
  } else {
    await Firebase.initializeApp(); // Uses default native setup
  }
  runApp(
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_)=>MainProvider(),),

  ],
   child:  EasyLocalization(
     supportedLocales: [Locale('en'), Locale('ar')],
     path: 'assets/translations',
     fallbackLocale: Locale('en'),
     child: MyApp(),
   ),),
  );
}

// import 'package:flutter/material.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: const HomePage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({super.key});
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
// class _HomePageState extends State<HomePage> {
//   String? selectedValue;
//   final List<String> items = ['Option 1', 'Option 2', 'Option 3'];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: PreferredSize(
//         preferredSize: const Size.fromHeight(70), // taller AppBar for dropdown
//         child: AppBar(
//           backgroundColor: Colors.white,
//           elevation: 1,
//           automaticallyImplyLeading: false,
//           title: Row(
//             children: [
//               const Text(
//                 'Dashboard',
//                 style: TextStyle(color: Colors.black, fontSize: 20),
//               ),
//               const SizedBox(width: 20),
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 12),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey.shade400),
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.grey.shade100,
//                 ),
//                 child: DropdownButtonHideUnderline(
//                   child: DropdownButton<String>(
//                     value: selectedValue,
//                     hint: const Text('Select option'),
//                     icon: const Icon(Icons.keyboard_arrow_down),
//                     items: items.map((String item) {
//                       return DropdownMenuItem<String>(
//                         value: item,
//                         child: Text(item),
//                       );
//                     }).toList(),
//                     onChanged: (newValue) {
//                       setState(() {
//                         selectedValue = newValue;
//                       });
//                     },
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//       body: Center(
//         child: Text(
//           selectedValue == null
//               ? 'No option selected'
//               : 'Selected: $selectedValue',
//           style: const TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Localization',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: Languagechange(),
    );
  }
}