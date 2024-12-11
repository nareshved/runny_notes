// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:runny_notes/data/bloc/runny_bloc.dart';
import 'package:runny_notes/data/bloc/runny_events.dart';
import 'package:runny_notes/data/bloc/runny_states.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("runny notes"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          BlocProvider.of<RunnyBloc>(context).add(AddNoteEvent(
              addNote: {"name": "Naresh Vaid", "msg": "Welcome bro.."}));
        },
        child: Icon(Icons.add),
      ),
      body: BlocBuilder<RunnyBloc, RunnyStates>(
        builder: (context, state) {
          List<Map<String, dynamic>> mData = state.mData;

          return ListView.builder(
            itemCount: mData.length,
            itemBuilder: (context, index) {
              return ListTile(
                tileColor: Colors.primaries[index],
                leading: Text("$index", style: TextStyle(color: Colors.white)),
                title: Text(
                  mData[index]["msg"],
                  style: TextStyle(color: Colors.white),
                ),
                subtitle: Text(mData[index]["name"],
                    style: TextStyle(color: Colors.white)),
                trailing: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<RunnyBloc>(context)
                              .add(UpdateNoteEvent(uIndex: index, updateNote: {
                            "name": "naresh kumar vaid is here",
                            "msg": "welcome note update is Completed",
                          }));

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("index no :  $index note is UPDATED")));
                        },
                        icon: Icon(
                          Icons.edit,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {
                          BlocProvider.of<RunnyBloc>(context)
                              .add(DeleteNoteEvent(dIndex: index));

                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                              content:
                                  Text("index no :  $index note is deleted")));
                        },
                        icon: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ))
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
