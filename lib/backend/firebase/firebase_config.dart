import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDhAZI43Xc4aYx7_V7dCIcWzmC3jdo6FJg",
            authDomain: "smartscribe-c1758.firebaseapp.com",
            projectId: "smartscribe-c1758",
            storageBucket: "smartscribe-c1758.firebasestorage.app",
            messagingSenderId: "598454420647",
            appId: "1:598454420647:web:f01764770d18614f580782",
            measurementId: "G-H5XPZQ69B1"));
  } else {
    await Firebase.initializeApp();
  }
}
