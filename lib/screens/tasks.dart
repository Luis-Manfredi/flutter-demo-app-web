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
  final _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();

    taskList = tasksData;
  }

  @override
  Widget build(BuildContext context) {

    addItemDialog(BuildContext context) => showDialog(
      context: context, 
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 400,
          width: 350,
          decoration: BoxDecoration(
            color: black,
            borderRadius: const BorderRadius.all(Radius.circular(15))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Add Item', style: TextStyle(color: ochre, fontSize: 18)),
                  CloseButton(
                    color: grey,
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextFormField(
                        controller: titleController,
                        style: TextStyle(color: white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                          hintStyle: TextStyle(color: grey),
                          hintText: 'Add task title',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: paleOchre.withOpacity(0.5),
                              width: 2
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(20))
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ochre,
                              width: 2
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(20))
                          )
                        ),
                      ),

                      const SizedBox(height: 30),

                      TextFormField(
                        controller: descriptionController,
                        style: TextStyle(color: white),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                          hintStyle: TextStyle(color: grey),
                          hintText: 'Add task description',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: paleOchre.withOpacity(0.5),
                              width: 2
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(20))
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: ochre,
                              width: 2
                            ),
                            borderRadius: const BorderRadius.all(Radius.circular(20))
                          )
                        ),
                      ),
                    ],
                  )
                ),
              ),

              CustomButton(
                function: () {
                  taskList.add(
                    Task(
                      name: titleController.text.toString(), 
                      description: descriptionController.text.toString()
                    )
                  );
                  setState(() {});
                  titleController.clear();
                  descriptionController.clear();
                  Navigator.pop(context);
                }, 
                text: 'Add New Task', 
                height: 50, 
                width: 150, 
                iconActive: true,
                icon: Icon(Icons.add_rounded, color: white,), 
                backgroundColor: ochre, 
                style: TextStyle(color: white)
              )
            ],
          ),
        ),
      )
    );

    Size size = MediaQuery.of(context).size;

    return Container(
      alignment: Alignment.topLeft,
      child: SingleChildScrollView(
        // physics: const NeverScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Tasks', style: TextStyle(color: white, fontSize: 36)),
              const SizedBox(height: 5),
              Text('Manage your daily tasks.', style: TextStyle(color: grey, fontSize: 18)),
      
              const SizedBox(height: 20),

              LayoutBuilder(
                builder: (context, constraints) {
                  if (size.width < 500) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Buscador / filtro
                        Container(
                          width: size.width,
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
                              contentPadding: const EdgeInsets.all(20),
                              hintText: 'Search task name',
                              hintStyle: TextStyle(color: white),
                              border: InputBorder.none,
                              suffixIcon: Container(
                                margin: const EdgeInsets.only(right: 5),
                                child: Icon(Icons.search, color: black))
                            ),
                            onChanged: searchTask,
                          ),
                        ),

                        // Botón 'Agregar Tarea'
                        CustomButton(
                          function: () => addItemDialog(context), 
                          text: 'Add New Task',
                          style: TextStyle(color: black), 
                          height: 50, 
                          width: 150,
                          backgroundColor: grey,
                          iconActive: true,
                          icon: Icon(Icons.add, color: black),
                        )
                      ],
                    );
                  }
                  else {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Buscador / filtro
                        Container(
                          width: 250,
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
                              contentPadding: const EdgeInsets.all(20),
                              hintText: 'Search task name',
                              hintStyle: TextStyle(color: white),
                              border: InputBorder.none,
                              suffixIcon: Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: Icon(Icons.search, color: black),
                              )
                            ),
                            onChanged: searchTask,
                          ),
                        ),

                        // Botón 'Agregar Tarea'
                        CustomButton(
                          function: () => addItemDialog(context), 
                          text: 'Add New Task',
                          style: TextStyle(color: black), 
                          height: 50, 
                          width: 150,
                          backgroundColor: grey,
                          iconActive: true,
                          icon: Icon(Icons.add, color: black),
                        )
                      ],
                    );
                  }
                }, 
              ),

              // Tabla
              Container(
                margin: const EdgeInsets.symmetric(vertical: 20),
                width: size.width,
                height: 400,
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
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
      ),
    );
  }

  // Constructor de Lista
  Widget listBuilder() {
    updateTaskDialog(BuildContext context, Task item) { 
      TextEditingController updateTitleController = TextEditingController(text: item.name);
      TextEditingController updateDescriptionController = TextEditingController(text: item.description);

      showDialog(
        context: context, 
        builder: (context) => Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(20),
            height: 400,
            width: 350,
            decoration: BoxDecoration(
              color: black,
              borderRadius: const BorderRadius.all(Radius.circular(15))
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Update Item', style: TextStyle(color: ochre, fontSize: 18)),
                    CloseButton(
                      color: grey,
                      onPressed: () => Navigator.pop(context),
                    )
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: updateTitleController,
                          style: TextStyle(color: white),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                            hintStyle: TextStyle(color: grey),
                            hintText: 'Add task title',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: paleOchre.withOpacity(0.5),
                                width: 2
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(20))
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ochre,
                                width: 2
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(20))
                            )
                          ),
                        ),

                        const SizedBox(height: 30),

                        TextFormField(
                          controller: updateDescriptionController,
                          style: TextStyle(color: white),
                          decoration: InputDecoration(
                            contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 8),
                            hintStyle: TextStyle(color: grey),
                            hintText: 'Add task description',
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: paleOchre.withOpacity(0.5),
                                width: 2
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(20))
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: ochre,
                                width: 2
                              ),
                              borderRadius: const BorderRadius.all(Radius.circular(20))
                            )
                          ),
                        ),
                      ],
                    )
                  ),
                ),

                CustomButton(
                  function: () {
                    setState(() {
                      item.name = updateTitleController.text.toString();
                      item.description = updateDescriptionController.text.toString();
                    });
                    updateTitleController.clear();
                    updateDescriptionController.clear();
                    Navigator.pop(context);
                  }, 
                  text: 'Update Task', 
                  height: 50, 
                  width: 150, 
                  iconActive: true,
                  icon: Icon(Icons.update_rounded, color: white,), 
                  backgroundColor: ochre, 
                  style: TextStyle(color: white)
                )
              ],
            ),
          ),
        )
      );
    }
    
    warningPrompt(BuildContext context, Task item) => showDialog(
      context: context, 
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.all(20),
          height: 250,
          width: 400,
          decoration: BoxDecoration(
            color: black,
            borderRadius: const BorderRadius.all(Radius.circular(15))
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Delete Item', style: TextStyle(color: ochre, fontSize: 18)),
                  CloseButton(
                    color: grey,
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),

              Text('Are you sure you want to delete this task?', style: TextStyle(color: white, fontSize: 18)),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomButton(
                    function: () {
                      setState(() { 
                        taskList.remove(item); 
                      });
                      Navigator.pop(context);
                    }, 
                    text: 'Delete Task', 
                    height: 50, 
                    width: MediaQuery.of(context).size.width < 500 ? 110 : 150, 
                    iconActive: false, 
                    backgroundColor: ochre, 
                    style: TextStyle(color: white)
                  ),
                  
                  CustomButton(
                    function: () => Navigator.pop(context), 
                    text: 'Cancel', 
                    height: 50, 
                    width: MediaQuery.of(context).size.width < 500 ? 110 : 150, 
                    iconActive: false, 
                    backgroundColor: grey, 
                    style: TextStyle(color: black)
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );

    return ListView.separated(
      padding: const EdgeInsets.symmetric(vertical: 10),  
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
                  onTap: () => warningPrompt(context, item),
                  child: Icon(Icons.delete_forever_rounded, color: ochre)
                ),
              ),

              const SizedBox(width: 30),

              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => updateTaskDialog(context, item),
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
  }


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