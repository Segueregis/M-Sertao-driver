import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:moto_sertao_flutter_drivers/splashScreen/splash_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );


  runApp(
    MyApp(
      child: MaterialApp(
        title: 'MOTORCYCLIST',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MySplashScreen(),
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

 class MyApp extends StatefulWidget
 {
  final Widget? child;

  const MyApp({super.key, this.child});

  static void restartApp(BuildContext context)
  {
    context.findAncestorStateOfType<_MyAppState>()!.restartApp();

  }
 
   @override
   State<MyApp> createState() => _MyAppState();
 }
 
 class _MyAppState extends State<MyApp>
 {
  Key key = UniqueKey();

  void restartApp()
  {
    setState(() {
      key = UniqueKey();
    });
  }

   @override
   Widget build(BuildContext context) {
     return KeyedSubtree(
       key: key,
       child: widget.child!,
     );
   }
 }
 
 


