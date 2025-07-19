import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:hook_up_rent/routes.dart';
import 'package:hook_up_rent/scoped_model/auth.dart';
import 'package:hook_up_rent/scoped_model/city.dart';
import 'package:hook_up_rent/scoped_model/room_filter.dart';
import 'package:scoped_model/scoped_model.dart';


class Application extends StatelessWidget {

  final AuthModel authModel = AuthModel();
  final FilterBarModel filterBarModel = FilterBarModel();
  final CityModel cityModel = CityModel();

  Application({super.key});

  @override
  Widget build(BuildContext context) {
    FluroRouter router = FluroRouter();
    Routes.configureRoutes(router);
    return ScopedModel<AuthModel>(model: authModel,
        child:  ScopedModel<FilterBarModel>(
          model: filterBarModel,
          child: ScopedModel<CityModel>(
            model: cityModel,
            child: MaterialApp(
            theme: ThemeData(
                primarySwatch: Colors.green
            ),
            onGenerateRoute: router.generator,
          ),
          )
        ));
  }
}
