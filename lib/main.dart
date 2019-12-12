import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:contact_list_bloc/bloc/bloc.dart';
import 'package:contact_list_bloc/model/contact.dart';
import 'package:contact_list_bloc/page/ListPage.dart';
import 'package:contact_list_bloc/page/splashpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class ItemList extends StatefulWidget {
  @override
  _ItemListState createState() => _ItemListState();
}

class _ItemListState extends State<ItemList> {
  ItemBloc _itemBloc;

  List<Contact> contacts = [];

  @override
  void initState() {
    _itemBloc = BlocProvider.of<ItemBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ItemBloc, ItemState>(builder: (context, state) {
      if (state is InitialState) {
        return SplashPage();
      } else if (state is ItemLoaded) {
        contacts = state.contactList;
      } else if (state is ItemLoading) {
        return Scaffold(
          appBar: AppBar(
            title: Text('list'),
          ),
          backgroundColor: Colors.white,
          body: Center(child: CircularProgressIndicator()),
        );
      }
      return Scaffold(
        appBar: AppBar(
          title: Text('list'),
        ),
        backgroundColor: Colors.white,
        body: contacts.isNotEmpty
            ? ListView.builder(
          itemBuilder: (context, index) => ListTile(
            onTap: () {
              _itemBloc.add(ChangeColor(
                  contactList: contacts,
                  selectedItem: contacts[index]));
            },
            title: Text(contacts[index].title),
            subtitle: Text(contacts[index].number),
            leading: CircleAvatar(
              child: Text(
                '${contacts[index].number}',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: contacts[index].backgroundColor,
            ),
            trailing: IconButton(
                icon: Icon(Icons.close),
                onPressed: () {
                  var item = contacts[index];
                  _itemBloc.add(DeleteItem(
                      deletedItem: item, contactList: contacts));
                }),
          ),
          itemCount: contacts.length,
        )
            : Center(child: Text('Empty List')),
      );
    });
  }
}
