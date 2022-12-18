import 'package:flutter/material.dart';

import '../components/task.dart';

class TaskInherited extends InheritedWidget {
  TaskInherited({Key? key, required Widget child})
      : super(key: key, child: child);

  final List<Task> listTask = [
    Task('Aprender Flutter', 'assets/images/dash.png', 3),
    Task('Andar de Bike', 'assets/images/bike.webp', 2),
    Task('Meditar', 'assets/images/meditar.jpeg', 5),
    Task('Ler', 'assets/images/livro.jpg', 4),
    Task('Jogar', 'assets/images/jogar.jpg', 1)
  ];

  double globalLevel = 0;

  void newTask(String name, String photo, int difficulty) {
    listTask.add(Task(name, photo, difficulty));
  }

  void calculateGlobalLevel() {
    int level = 0;
    int difficulty = 0;

    globalLevel = 0;

    for (int i = 0; i < listTask.length; i++) {
      level = listTask[i].nivel;
      difficulty = listTask[i].dificuldade;

      globalLevel += level * (difficulty / 10);
    }
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, 'Nenhum TaskInherited encontrado no contexto');
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.listTask.length != listTask.length ||
        oldWidget.globalLevel != globalLevel;
  }
}
