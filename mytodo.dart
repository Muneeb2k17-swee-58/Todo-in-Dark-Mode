import 'package:flutter/material.dart';

class Mytodo extends StatefulWidget {
  @override
  _MytodoState createState() => _MytodoState();
}

List<dynamic> lst = ["", "", "", "", ""];
var output = '';

class _MytodoState extends State<Mytodo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Padding(
          padding: EdgeInsets.only(top: 4),
          child: TextField(
            decoration: InputDecoration(
              suffixIcon: Icon(Icons.search),
              suffixIconConstraints:
                  BoxConstraints(maxHeight: 20, maxWidth: 20),
              border: InputBorder.none,
              hintText: 'Search your notes',
              hintStyle: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
      drawer: Padding(
        padding: EdgeInsets.all(2.0),
        child: Drawer(
          child: ListView(
            children: [
              ListTile(
                title: Text(
                  'Google Keep',
                  style: TextStyle(
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              iconandtitle(Icon(Icons.light), 'Notes'),
              iconandtitle(Icon(Icons.alarm_add_outlined), 'Reminders'),
              iconandtitle(Icon(Icons.add), 'Create New'),
              iconandtitle(Icon(Icons.archive), 'Archive'),
              iconandtitle(Icon(Icons.delete_sharp), 'Trash'),
              iconandtitle(Icon(Icons.settings), 'Settings'),
              iconandtitle(Icon(Icons.help_center), 'Help & feedback'),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: ListView.builder(
            itemCount: lst.length,
            itemBuilder: (context, index) {
              return Container(
                  height: MediaQuery.of(context).size.height * 0.09,
                  color: Colors.blueGrey,
                  padding: EdgeInsets.only(top: 5.0),
                  margin: EdgeInsets.only(top: 5.0),
                  child: ListTile(
                    title: Text(
                      '${lst[index]}',
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                    trailing: Container(
                      width: 50,
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      title: Text('Edit Here'),
                                      content: TextField(
                                        onChanged: (value) {
                                          output = value;
                                        },
                                      ),
                                      actions: [
                                        Center(
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              setState(() {
                                                lst.replaceRange(
                                                    index, index + 1, {output});
                                              });
                                            },
                                            child: Text('Edit'),
                                            style: ButtonStyle(
                                                padding:
                                                    MaterialStateProperty.all(
                                                        EdgeInsets.all(20)),
                                                backgroundColor:
                                                    MaterialStateProperty.all<
                                                            Color>(
                                                        Colors.blueGrey)),
                                          ),
                                        )
                                      ],
                                    );
                                  });
                            },
                            child: Icon(
                              Icons.edit,
                              size: 24,
                              color: Colors.white,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                lst.removeAt(index);
                              });
                            },
                            child: Icon(
                              Icons.delete,
                              size: 24,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            }),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Add Item'),
                    content: TextField(
                      onChanged: (value) {
                        output = value;
                      },
                    ),
                    actions: [
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            setState(() {
                              lst.add(output);
                            });
                          },
                          child: Text('Add'),
                          style: ButtonStyle(
                              padding:
                                  MaterialStateProperty.all(EdgeInsets.all(20)),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Colors.blueGrey)),
                        ),
                      )
                    ],
                  );
                });
          },
          backgroundColor: Colors.purple,
          child: Icon(
            Icons.add,
            color: Colors.white,
          )),
    );
  }
}

Widget iconandtitle(Icon icon, String title) {
  return ListTile(
    leading: icon,
    title: Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
  );
}
