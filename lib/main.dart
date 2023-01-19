import 'package:cng_495_ui/pages/Home.dart';
import 'package:cng_495_ui/pages/admin.dart';
import 'package:cng_495_ui/pages/market.dart';
import 'package:cng_495_ui/pages/dashboard.dart';
import 'package:cng_495_ui/pages/login.dart';
import 'package:cng_495_ui/pages/notifications.dart';
import 'package:cng_495_ui/pages/profile.dart';
import 'package:cng_495_ui/pages/reports.dart';
import 'package:cng_495_ui/pages/splash_screen.dart';
import 'package:flutter/material.dart';

// Amplify Flutter Packages
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

// Generated in previous step
import 'amplifyconfiguration.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  initState() {
    super.initState();
    _configureAmplify();
  }

  Future<void> _configureAmplify() async {
    // Add any Amplify plugins you want to use
    final authPlugin = AmplifyAuthCognito();
    await Amplify.addPlugin(authPlugin);

    // You can use addPlugins if you are going to be adding multiple plugins
    // await Amplify.addPlugins([authPlugin, analyticsPlugin]);

    // Once Plugins are added, configure Amplify
    // Note: Amplify can only be configured once.
    try {
      await Amplify.configure(amplifyconfig);
    } on AmplifyAlreadyConfiguredException {
      safePrint(
          "Tried to reconfigure Amplify; this can occur when your app restarts on Android.");
    }
  }

  void safePrint(String message) {
    print(message);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CNG 495 DEMO',
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: const SplashScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/register': (context) => const SplashScreen(),
        '/home': (context) => const DashboardScreen(),
        '/reports': (context) => const ReportsScreen(),
        '/profile': (context) => const ProfilePage(),
        '/notifications': (context) => const NotificationsScreen(),
        '/admin': (context) => const AdminScreen(),
      },
    );
  }
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'CNG 495 DEMO',
//       theme: ThemeData(
//         primarySwatch: Colors.brown,
//       ),
//       home: const SplashScreen(),
//       routes: {
//         '/login': (context) => const LoginScreen(),
//         '/register': (context) => const SplashScreen(),
//         '/home': (context) => const DashboardScreen(),
//         '/reports': (context) => const ReportsScreen(),
//         '/profile': (context) => const ProfilePage(),
//         '/notifications': (context) => const NotificationsScreen(),
//       },
//     );
//   }
// }
