import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rest_up_flutter/screens/splas_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'themes/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => CustomTheme(ThemeData.dark()),
      child: const MaterialAppTheme(),
    );
  }
}

class MaterialAppTheme extends StatelessWidget {
  const MaterialAppTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<CustomTheme>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      title: "RestUp",
      home: const Splash(),
    );
  }
}
