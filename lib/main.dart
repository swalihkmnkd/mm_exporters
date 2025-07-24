import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:mm_exporters/provider.dart';
import 'package:provider/provider.dart';
import 'language_change.dart';

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

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Localization',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: LanguageChange(),
    );
  }
}