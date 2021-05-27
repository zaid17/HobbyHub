import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hobby_hub_ui/socket_manager.dart';
import 'package:hobby_hub_ui/config/palette.dart';
import 'package:hobby_hub_ui/config/routes.dart';
import 'package:hobby_hub_ui/controller/hobby_controller.dart';
import 'package:hobby_hub_ui/controller/post_controller.dart';
import 'package:hobby_hub_ui/controller/user_controller.dart';
import 'package:hobby_hub_ui/db/app_color_db.dart';
import 'package:hobby_hub_ui/db/token_db.dart';
import 'package:hobby_hub_ui/socket_dependency_injection.dart';
import 'package:hobby_hub_ui/screens/login_screen.dart';
import 'package:hobby_hub_ui/screens/bottom_bar.dart';
import 'package:provider/provider.dart';

Injector socketInjector;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initApp();
  runApp(
    Phoenix(
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => UserController()),
          ChangeNotifierProvider(create: (context) => PostController()),
          ChangeNotifierProvider(create: (context) => HobbyController()),
        ],
        builder: (BuildContext context, _) => HobbyHubApp(),
      ),
    ),
  );
}

bool isAuth = false;

initApp() async {
  socketInjector = Injector();
  DependencyInjection().initialise(socketInjector);
  SocketManager().socketService.createSocketConnection();
  try {
    await Hive.initFlutter();
    await TokenDB().openTokenBox();
    await AppColorDB().openAppColorDbBox();
    isAuth = await UserController().authenticateToken();
    await HobbyController().getAllHobbies();

  } catch (e) {
    print(e);
  }
}

class HobbyHubApp extends StatefulWidget {
  @override
  _HobbyHubAppState createState() => _HobbyHubAppState();
}

class _HobbyHubAppState extends State<HobbyHubApp> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      initial: AdaptiveThemeMode.system,
      dark: Palette.darkTheme,
      light: Palette.lightTheme,
      builder: (ThemeData light, ThemeData dark) => MaterialApp(
        initialRoute: (isAuth || UserController().currentUser != null)
            ? NavScreen.id
            : LoginScreen.id,
        routes: Routes.routes,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Project, Graduation Project two.',
        theme: light,
        darkTheme: dark,
      ),
    );
  }
}
