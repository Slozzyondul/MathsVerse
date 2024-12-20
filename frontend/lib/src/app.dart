import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:frontend/src/features/algebra/main_algebra.dart';
import 'package:frontend/src/features/calculus/main_calculus.dart';
import 'package:frontend/src/features/linear_algebra/main_linear_algebra.dart';
import 'package:frontend/src/features/matrix/main_matrix.dart';
import 'package:frontend/src/features/numerical/main_numerical.dart';
import 'package:frontend/src/features/probability/main_probability.dart';
import 'package:frontend/src/features/resources/main_resources.dart';
import 'package:frontend/src/maindashboard.dart';

import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    // Glue the SettingsController to the MaterialApp.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          restorationScopeId: 'app',
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define the routes
          onGenerateRoute: (RouteSettings routeSettings) {
            switch (routeSettings.name) {
              case '/settings':
                return MaterialPageRoute<void>(
                  settings: routeSettings,
                  builder: (BuildContext context) =>
                      SettingsView(controller: settingsController),
                );
              case '/matrix':
                return MaterialPageRoute<void>(
                  settings: routeSettings,
                  builder: (BuildContext context) => const MatrixScreen(),
                );
              case '/calculus':
                return MaterialPageRoute<void>(
                  settings: routeSettings,
                  builder: (BuildContext context) => const CalculusScreen(),
                );
              case '/numerical':
                return MaterialPageRoute<void>(
                  settings: routeSettings,
                  builder: (BuildContext context) => const NumericalAnalysisScreen(),
                );
              case '/probability':
                return MaterialPageRoute<void>(
                  settings: routeSettings,
                  builder: (BuildContext context) => const ProbabilityScreen(),
                );
              case '/algebra':
                return MaterialPageRoute<void>(
                  settings: routeSettings,
                  builder: (BuildContext context) => const AlgebraScreen(),
                );
              case '/linearalgebra':
                return MaterialPageRoute<void>(
                  settings: routeSettings,
                  builder: (BuildContext context) => const LinearAlgebraScreen(),
                );
              case '/resources':
                return MaterialPageRoute<void>(
                  settings: routeSettings,
                  builder: (BuildContext context) => const ResourcesScreen(),
                );
              default:
                return MaterialPageRoute<void>(
                  settings: routeSettings,
                  builder: (BuildContext context) => const MainOptionScreen(),
                );
            }
          },
        );
      },
    );
  }
}