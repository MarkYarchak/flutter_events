import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
//import 'package:hydrated_bloc/hydrated_bloc.dart';



//enum CommentsEvent { get, add, delete }

//class CounterBloc extends HydratedBloc<CommentsEvent, EventCommentsState> {
//  @override
//  EventCommentsState get initialState => super.initialState ?? EventCommentsState([]);
//
//  @override
//  Stream<EventCommentsState> mapEventToState(CommentsEvent event) async* {
//    switch (event) {
//      case CommentsEvent.get:
//        yield EventCommentsState(state.commentsList);
//        break;
//      case CommentsEvent.add:
//        yield EventCommentsState([ ...state.commentsList, {} ].toList());
//        break;
//      case CommentsEvent.delete:
//        final filteredList = state.commentsList.where((c) => c != {}).toList();
//        yield EventCommentsState(filteredList);
//        break;
//    }
//  }
//
//  @override
//  EventCommentsState fromJson(Map<String, dynamic> source) {
//    return EventCommentsState(source['commentsList'] as List);
//  }
//
//  @override
//  Map<String, List> toJson(EventCommentsState state) {
//    return {'commentsList': state.commentsList};
//  }
//}



class EventComments extends StatefulWidget {

  @override
  EventCommentsState createState() => EventCommentsState();

}

class EventCommentsState extends State<EventComments> {

  List commentsList = [].toList();

  EventCommentsState();



  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    Widget _buildRow(int idx) {
      return ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.transparent,
          backgroundImage: NetworkImage('https://www.gettyimages.com/gi-resources/images/500px/983794168.jpg'),
        ),
        title: Text(
          'Item $idx',
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 16),
        ),
        trailing: Text('20:00'),
        subtitle: Text('my comment'),
      );
    }

    Widget commentsList() {
      final numItems = 20;

      return ListView.builder(
        itemCount: numItems * 2,
        padding: const EdgeInsets.only(left: 0, top: 8, bottom: 8, right: 0),
        itemBuilder: (BuildContext context, int i) {
          if (i.isOdd) return Divider();
          final index = i ~/ 2 + 1;
          return _buildRow(index);
        },
      );
    }

    Widget _inputField() {
      return Container(
        padding: EdgeInsets.only(left: 5, right: 5),
        child: TextField(
          decoration: InputDecoration(
              hintText: 'Напишіть повідомлення'
          ),
          maxLines: 10,
          minLines: 1,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Title(
          color: Colors.blue,
          child: Text('Чат події'),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: commentsList(),
      ),
    );
  }

}
