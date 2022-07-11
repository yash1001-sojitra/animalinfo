// ignore_for_file: unused_local_variable

import 'package:animalinformation/router/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'logic/provider/userData_provider.dart';
import 'logic/service/auth_services/auth_service.dart';
import 'logic/service/fireStoreServices/user_firestore_services.dart';

Future<void> main() async {
  int? initScreen;
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  await Firebase.initializeApp();

  runApp(MultiProvider(
    providers: [
      StreamProvider.value(
        value: UserDataFirestoreService().getUserData(),
        initialData: null,
      ),
      ChangeNotifierProvider.value(
        value: UsereDataProvider(),
      ),
      Provider<AuthService>(
        create: (_) => AuthService(),
      ),
      Provider<UserDataFirestoreService>(
        create: (_) => UserDataFirestoreService(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      onGenerateRoute: Routes.generateRoute,
    );
  }
}
