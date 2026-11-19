import 'package:flutter/material.dart';
import 'package:to_day/Task.dart';

import 'database/imdb.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To-Day Tasks',
      theme: ThemeData(colorScheme: .fromSeed(seedColor: Colors.red)),
      home: const MyHomePage(title: 'To-Day Tasks'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
        mainAxisAlignment: .start,
        children: [
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: TextFormField(
                    controller: controller,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8),
                child: IconButton(
                  onPressed: () {
                    if (controller.text.trim().isEmpty)
                      return;
                    else {
                      setState(() {
                        Imdb.items.add(Task(controller.text));
                        controller.clear();
                      });
                    }
                  },
                  icon: Icon(Icons.add),
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Divider(),
          if(Imdb.items.isEmpty)
            Text("No tasks! Try adding one.")
          else
          Expanded(
            child: ListView.builder(
              itemCount: Imdb.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(
                    value: Imdb.items[index].checked,
                    onChanged: (value) {
                      setState(() {
                        Imdb.items[index].change();
                      });
                    },
                  ),
                  title: Text(
                    Imdb.items[index].description,
                    style: Imdb.items[index].checked
                        ? TextStyle(decoration: TextDecoration.lineThrough)
                        : TextStyle(),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      setState(() {
                        Imdb.items.removeAt(index);
                      });
                    },
                    icon: Icon(Icons.delete, color: Colors.red),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
