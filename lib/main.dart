import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'auth/firebase_user_provider.dart';
import 'flutter_color/flutter_color_theme.dart';
import 'flutter_color/internationalization.dart';
import 'index.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await FlutterFlowTheme.initialize();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;
  ThemeMode _themeMode = FlutterFlowTheme.themeMode;

  Stream<New1FirebaseUser> userStream;
  New1FirebaseUser initialUser;
  bool displaySplashImage = true;

  @override
  void initState() {
    super.initState();
    userStream = new1FirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
    Future.delayed(
      Duration(seconds: 3),
      () => setState(() => displaySplashImage = false),
    );
  }

  void setLocale(Locale value) => setState(() => _locale = value);
  void setThemeMode(ThemeMode mode) => setState(() {
        _themeMode = mode;
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'New1',
      localizationsDelegates: [
        FFLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      locale: _locale,
      supportedLocales: const [Locale('en', '')],
      theme: ThemeData(brightness: Brightness.light),
      darkTheme: ThemeData(brightness: Brightness.dark),
      home: displaySplashImage
          ? Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 20, 17, 166),
                  Color.fromARGB(255, 144, 207, 228),
                  Color.fromARGB(255, 24, 229, 143)
                ],
              )),
              //color: Color(0xFF02A0B4),
              child: Center(
                child: Builder(
                  builder: (context) => Image.asset(
                    'assets/images/234.png',
                    width: MediaQuery.of(context).size.width * 0.3,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            )
          : AccountPageWidget(),
    );
  }
}
