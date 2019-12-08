import 'package:bloc/bloc.dart';
import 'package:contact_list_bloc/bloc/bloc.dart';
import 'package:contact_list_bloc/page/ListPage.dart';
import 'package:contact_list_bloc/page/splashpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'model/contact.dart';

void main() {
  BlocSupervisor.delegate = _Deligate();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: BlocProvider<ItemBloc>(
        create: (context) => ItemBloc()..add(AppStart()),
        child: ItemList(),
      ),
    );
  }
}

class _Deligate extends BlocDelegate {
  @override
  void onError(Bloc bloc, Object error, StackTrace stacktrace) {
    super.onError(bloc, error, stacktrace);
    print('error : $error & stack : $stacktrace');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('bloc : $bloc , transaction : $transition');
  }
}

class ItemList extends StatelessWidget {
  final List<Contact> contacts = [];

  @override
  Widget build(BuildContext context) {
    for (var i = 0; i <= 5; i++) {
      contacts.add(new Contact(title: 'item$i', number: '0912536192$i'));
    }

    return BlocBuilder<ItemBloc, ItemState>(builder: (context, state) {
      if (state is InitialState) {
        return SplashPage();
      }
      if (state is ItemLoading) {
        return ListPage(
          contact: contacts,
        );
      }
      if (state is ItemPop) {
        contacts.isNotEmpty ? contacts.removeLast() : null;
        return ListPage(
          contact: contacts,
        );
      }
      return null;
    });
  }
}
