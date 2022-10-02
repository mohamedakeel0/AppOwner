import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodapp/shared/network/remot/local/cache_helper.dart';
import 'package:foodapp/shared/network/remot/remote/dio_helper.dart';
import 'package:foodapp/shared/resources/constants_manager.dart';
import 'package:foodapp/shared/resources/routes_manager.dart';
import 'package:foodapp/shared/resources/theme_manager.dart';

import 'bloc/bloc_observer/blocObserver.dart';
import 'bloc/cubic.dart';
import 'bloc/states.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AppCubic()..checkEnternet()..getCurrentLocation()..getPosition()..getdetailsservices(2)..getCategories(0) ,)

      ],
      child: BlocConsumer<AppCubic, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {

          return MaterialApp(theme: getApplicationTheme(), onGenerateRoute: RouteGenerator.getRoute,
            initialRoute: Routes.menu_screen,

            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
