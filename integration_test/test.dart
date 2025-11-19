import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:smart_scribe/flutter_flow/flutter_flow_icon_button.dart';
import 'package:smart_scribe/flutter_flow/flutter_flow_widgets.dart';
import 'package:ff_theme/flutter_flow/flutter_flow_theme.dart';
import 'package:smart_scribe/index.dart';
import 'package:smart_scribe/main.dart';
import 'package:smart_scribe/flutter_flow/flutter_flow_util.dart';
import 'package:confetti_modualo_library_b75kfy/app_state.dart'
    as confetti_modualo_library_b75kfy_app_state;

import 'package:provider/provider.dart';
import 'package:smart_scribe/backend/firebase/firebase_config.dart';
import 'package:smart_scribe/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();

    await FlutterFlowTheme.initialize();
  });

  setUp(() async {
    await authManager.signOut();
    FFAppState.reset();
    final appState = FFAppState();
    await appState.initializePersistedState();
    confetti_modualo_library_b75kfy_app_state.FFAppState.reset();
    await confetti_modualo_library_b75kfy_app_state.FFAppState()
        .initializePersistedState();
  });

  testWidgets('UserAccountCreationTest', (WidgetTester tester) async {
    _overrideOnError();

    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FFAppState(),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              confetti_modualo_library_b75kfy_app_state.FFAppState(),
        ),
      ],
      child: MyApp(
        entryPage: SignUpWidget(),
      ),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.enterText(
        find.byKey(const ValueKey('Signup-Email_on5i')), 'test@uri.edu');
    await tester.enterText(
        find.byKey(const ValueKey('Signup-Password_i6nz')), 'Password');
    await tester.enterText(
        find.byKey(const ValueKey('Signup-ConfirmPassword_xl79')), 'Password');
    await tester.tap(find.byKey(const ValueKey('Signup-Button_ioh3')));
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    expect(find.text('Please Enter your name...'), findsWidgets);
  });

  testWidgets('UserAccountCreationTest', (WidgetTester tester) async {
    _overrideOnError();
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: 'jordan.melnick@uri.edu', password: 'happy123');
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => FFAppState(),
        ),
        ChangeNotifierProvider(
          create: (context) =>
              confetti_modualo_library_b75kfy_app_state.FFAppState(),
        ),
      ],
      child: const MyApp(),
    ));
    await GoogleFonts.pendingFonts();

    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    await tester.tap(find.byKey(const ValueKey('Button_klkk')));
    await tester.pumpAndSettle(const Duration(milliseconds: 3000));
    expect(find.text('Choose Audio File'), findsOneWidget);
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }
  // Web-specific error when interacting with TextInputType.emailAddress
  if (error.contains('setSelectionRange') &&
      error.contains('HTMLInputElement')) {
    return true;
  }

  return false;
}
