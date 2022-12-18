import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/data/task_inherited.dart';
import 'package:nosso_primeiro_projeto/screens/form_screnn.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({Key? key}) : super(key: key);

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  double globalLevel = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Tarefas'),
                  IconButton(
                      iconSize: 24,
                      onPressed: () {
                        setState(() {
                          TaskInherited.of(context).calculateGlobalLevel();
                        });
                      },
                      icon: Icon(Icons.wifi_protected_setup))
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 250,
                  child: LinearProgressIndicator(
                    value: (TaskInherited.of(context).globalLevel /
                            TaskInherited.of(context).listTask.length) /
                        10,
                    color: Colors.white,
                    minHeight: 5,
                  ),
                ),
                Text(
                  "Level: ${TaskInherited.of(context).globalLevel.toStringAsFixed(2)}",
                  style: TextStyle(fontSize: 15),
                )
              ],
            ),
          ],
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        children: TaskInherited.of(context).listTask,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (newContext) => FormScreen(
                  taskContext: context,
                ),
              ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
