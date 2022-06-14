import 'package:demo_web_app/components/custom_button.dart';
import 'package:demo_web_app/constants/colors.dart';
import 'package:demo_web_app/data/task_data.dart';
import 'package:flutter/material.dart';

class Tasks extends StatefulWidget {
  const Tasks({Key? key}) : super(key: key);

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {

  // Inicialización
  late List<Task> taskList;
  String query = '';

  @override
  void initState() {
    super.initState();

    taskList = tasksData;
  }

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
      alignment: Alignment.topLeft,

      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Tasks', style: TextStyle(color: white, fontSize: 36)),
      
            const SizedBox(height: 40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Buscador / filtro
                Container(
                  width: 200,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: ochre,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: const Offset(0, 2)
                      )
                    ]
                  ),
                  child: TextField(
                    cursorColor: black,
                    style: TextStyle(color: black),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                      hintText: 'Search',
                      hintStyle: TextStyle(color: white),
                      border: InputBorder.none
                    ),
                    onChanged: searchTask,
                  ),
                ),

                // Botón 'Agregar Tarea'
                CustomButton(
                  function: (){}, 
                  text: 'Add New Task',
                  style: TextStyle(color: black), 
                  height: 50, 
                  width: 150,
                  backgroundColor: grey,
                  iconActive: true,
                  icon: Icon(Icons.add, color: black),
                )
              ],
            ),
 
            // Tabla
            Container(
              margin: const EdgeInsets.symmetric(vertical: 20),
              width: size.width,
              height: size.height * 0.5,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: black,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 2,
                    offset: const Offset(0, 2)
                  )
                ]
              ),

              child: taskList.isEmpty ? 
              Center(child: Text('No tasks at the moment. Click the button above to add a new task', 
              style: TextStyle(color: grey, fontSize: 20)))
              : listBuilder(),
            )
          ],
        ),
      ),
    );
  }

  // Constructor de Lista
  Widget listBuilder() => ListView.separated(
      itemBuilder: (context, index) {
        var leadingNum = index + 1;
        var item = taskList[index];
        return ListTile(
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(leadingNum.toString()),
            ],
          ),
          title: Text(item.name, style: TextStyle(color: white, fontSize: 16)),
          subtitle: Text(item.description, style: TextStyle(color: white, fontSize: 14)),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      taskList.remove(item);
                    });
                  },
                  child: Icon(Icons.delete_forever_rounded, color: ochre)
                ),
              ),

              const SizedBox(width: 30),

              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: (){},
                  child: Icon(Icons.edit_rounded, color: white)
                ),
              ),
            ],
          ),
        );
      }, 
      separatorBuilder: (context, index) => const Divider(), 
      itemCount: taskList.length
  );


  // Función buscar tarea
  void searchTask(String query) {
    final taskList = tasksData.where((service) {
      final lowerName = service.name.toLowerCase();
      final searchLower = query.toLowerCase();

      return lowerName.contains(searchLower);
    }).toList();

    setState(() {
      this.query = query;
      this.taskList = taskList;
    });
  }
}