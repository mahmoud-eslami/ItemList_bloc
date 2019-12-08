import 'package:contact_list_bloc/bloc/bloc.dart';
import 'package:contact_list_bloc/model/contact.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListPage extends StatelessWidget {
  final List<Contact> contact;

  const ListPage({Key key, this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.delete),
          onPressed: () {
            BlocProvider.of<ItemBloc>(context).add(PressDeleteBtn());
          }),
      appBar: AppBar(
        title: Text('Contact'),
      ),
      body: contact.isNotEmpty ? ListView.builder(
        itemCount: contact.length,
        itemBuilder: (context, index) => ListTile(
          title: Text(contact[index].title),
          subtitle: Text(contact[index].number),
          leading: CircleAvatar(
            child: Text('$index'),
            backgroundColor: Colors.greenAccent,
          ),
        ),
      ) : Center(child:Text('<< finished >>',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),))
    );
  }
}
