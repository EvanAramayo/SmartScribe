// Automatic FlutterFlow imports
import '/backend/backend.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// // Automatic FlutterFlow imports
// import '/backend/backend.dart';
// import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
// import '/flutter_flow/flutter_flow_util.dart';
// import '/custom_code/actions/index.dart'; // Imports other custom actions
// import '/flutter_flow/custom_functions.dart'; // Imports custom functions
// import 'package:flutter/material.dart';
// // Begin custom action code
// // DO NOT REMOVE OR MODIFY THE CODE ABOVE!

// // make this action take the user to the npr screen after their third time logging on
// import 'package:shared_preferences/shared_preferences.dart';

// Future newCustomAction() async {
//   // Get shared preferences instance
//   final prefs = await SharedPreferences.getInstance();

//   // Get current login count, defaulting to 0 if not found
//   int loginCount = prefs.getInt('login_count') ?? 0;

//   // Increment login count
//   loginCount++;

//   // Save updated login count
//   await prefs.setInt('login_count', loginCount);

//   // Check if this is the third login
//   if (loginCount >= 3) {
//     // Navigate to NPR screen
//     if (Navigator.of(context).canPop()) {
//       Navigator.of(context).pushReplacementNamed('/npr');
//     } else {
//       Navigator.of(context).pushNamed('/npr');
//     }
//   }
// }
/////////////////////////////////////////////////////////////////////////////////////////////
// TEST CODE BELOW:

import 'package:shared_preferences/shared_preferences.dart';

Future<void> newCustomAction(BuildContext context) async {
  // Get shared preferences instance
  final prefs = await SharedPreferences.getInstance();

  // Get current login count, defaulting to 0 if not found
  int loginCount = prefs.getInt('login_count') ?? 0;

  // Increment login count
  loginCount++;

  // Save updated login count
  await prefs.setInt('login_count', loginCount);

  // If user has logged in 3 or more times, go to NPS page
  if (loginCount >= 1) {
    // Use FlutterFlow navigation helper with the page's route name
    // Make sure this matches the Route field on your NPS page exactly
    context.pushNamed('NPSpage');
  }
}
