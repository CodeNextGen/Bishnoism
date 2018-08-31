import 'dart:async';
import 'package:flutter/material.dart';
import 'pages/plants_list/plants_list_page.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:plantly/store.dart';
import 'package:plantly/redux/reducers/app/app_state.dart';
import 'package:plantly/theme/themes.dart';
import 'package:plantly/localization.dart';
import 'package:plantly/middleware/products.dart';
import 'package:plantly/redux/actions/FetchProducts.dart';

Future<Null> main() async {
  var store = await createStore();
  runApp(MyApp(store));
}

class MyApp extends StatelessWidget {

  final Function(dynamic) next = (action) => print(action);
  Store<AppState> store;

  MyApp(Store<AppState> store) {
    this.store = store;
    ProductsMiddleWare().call(store, FetchProducts(true, null), next);
  }

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: this.store,
      child: MaterialApp(
          title: AppLocalizations().appTitle,
          theme: lightTheme.data,
          localizationsDelegates: [
            new AppLocalizationsDelegate(),
          ],
          home: PlantsListPage()),
    );
  }
}
