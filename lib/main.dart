import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:todo/providers/todo_list_provider.dart';
import 'package:todo/screens/homepage.dart';
import 'package:provider/provider.dart';

/// The main entry point for the app.
///
/// Ensures that the Flutter binding is initialized, Hive is initialized for
/// Flutter, and the app is run with a [ChangeNotifierProvider] that provides a
/// [TodoListProvider].
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  runApp(ChangeNotifierProvider(
    create: (_) => TodoListProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override

  /// Build the application.
  ///
  /// Returns a [GetMaterialApp] that sets up the app with a debug banner
  /// turned off and a title of 'Todo'. The app is themed with a dark purple
  /// color scheme seeded from [Colors.deepPurple] and using Material 3. The
  /// home page is a [HomePage] with a title of 'T O D O'.
  ///
  /// This widget is the root of the application, and is the only widget that
  /// is created by [main].
  Widget build(BuildContext context) {
    return GetMaterialApp(
      // color: Colors.transparent,
      debugShowCheckedModeBanner: false,
      title: 'Todo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(title: 'T O D O'),
    );
  }
}
