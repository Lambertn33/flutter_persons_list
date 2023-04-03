import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final appBarTitle = 'Persons App';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.orange),
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              appBarTitle,
              style: const TextStyle(color: Colors.white),
            ),
          ),
          body: PersonsList(),
        ));
  }
}

// ignore: must_be_immutable
class PersonsList extends StatelessWidget {
  PersonsList({super.key});
  List<Person> persons = List.generate(
      200,
      (index) => Person(
          'person names # ${index + 1}', 'person location # ${index + 1}'));
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          var person = persons[index];
          return viewPerson(person, context);
        },
        itemCount: persons.length);
  }
}

Card viewPerson(person, context) {
  return Card(
    child: ListTile(
      onTap: () {
        showAlertDialog(person, context);
      },
      title: Text(person.names, style: const TextStyle(fontSize: 20)),
      subtitle: Text(person.location),
      leading: const CircleAvatar(
        child: ImageIcon(AssetImage('assets/images/avatar.png')),
      ),
      trailing: const Icon(Icons.delete),
    ),
  );
}

showAlertDialog(person, BuildContext context) {
  final String alertTitle = person.names;
  final String alertContent =
      '${person.names} is a software engineer located in ${person.location}';
  showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(alertTitle),
          content: SingleChildScrollView(
            child: Text(alertContent * 50),
          ),
          actions: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)),
                child: const Text(
                  'Approve',
                  style: TextStyle(color: Colors.white),
                )),
            ElevatedButton(
                onPressed: () {},
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.red)),
                child: const Text(
                  'Reject',
                  style: TextStyle(color: Colors.white),
                ))
          ],
        );
      });
}

class Person {
  String names = '';
  String location = '';
  Person(this.names, this.location);
}
