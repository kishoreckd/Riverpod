import 'package:spi/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab/flutter_lab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(
    child: MyApp(),
  ));
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {

//     @override
//     Widget build(BuildContext context) {
//       return ChangeNotifierProvider(
//         create:(context)=> TodoProvider(),
//         child:const MaterialApp(
//           home: HomePage(),
//         )
//       );
//     }

// }

/**Used for riverPod stastemanagement  */
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      title: 'RiverPod',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Homepage(),
    );
  }
}
