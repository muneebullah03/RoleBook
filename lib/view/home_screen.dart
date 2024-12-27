import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:contact_app/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final CollectionReference myItem =
      FirebaseFirestore.instance.collection("myItem");
  final nameContoller = TextEditingController();
  final positionContoller = TextEditingController();

  @override
  void dispose() {
    nameContoller.dispose();
    positionContoller.dispose();
    super.dispose();
  }

  Future<void> create() async {
    nameContoller.clear();
    positionContoller.clear();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return myDialoge(
              name: 'Create Operation',
              condition: 'Create',
              onpress: () {
                if (nameContoller.text.isEmpty ||
                    positionContoller.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Fields cannot be empty')),
                  );
                  return;
                }
                final String name = nameContoller.text;
                final String position = positionContoller.text;
                addItem(name, position);
                Navigator.pop(context);
              });
        });
  }

  void addItem(String name, String position) async {
    try {
      await myItem.add({'name': name, 'position': position});
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Item added successfully!')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to add item: $e')),
      );
    }
  }

  Future<void> updateData(DocumentSnapshot documentSnapshot) {
    nameContoller.text = documentSnapshot['name'];
    positionContoller.text = documentSnapshot['position'];
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return myDialoge(
              name: 'Update Operation',
              condition: 'Update',
              onpress: () async {
                if (nameContoller.text.isEmpty ||
                    positionContoller.text.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Fields cannot be empty')),
                  );
                  return;
                }
                final String name = nameContoller.text;
                final String position = positionContoller.text;
                try {
                  await myItem
                      .doc(documentSnapshot.id)
                      .update({'name': name, 'position': position});
                  nameContoller.text = '';
                  positionContoller.text = '';
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Item updated successfully')),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Failed to update: $e')),
                  );
                }
                Navigator.pop(context);
              });
        });
  }

  Future<void> delete(String id) async {
    try {
      await myItem.doc(id).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Deleted successfully')),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to delete: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home Screen'),
        centerTitle: true,
        backgroundColor: AppColors.primaryColor,
      ),
      body: Column(
        children: [
          StreamBuilder(
            stream: myItem.snapshots(),
            builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
              if (streamSnapshot.hasError) {
                return Center(child: Text('Error: ${streamSnapshot.error}'));
              }
              if (streamSnapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              if (streamSnapshot.hasData &&
                  streamSnapshot.data!.docs.isNotEmpty) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      final DocumentSnapshot documentSnapshot =
                          streamSnapshot.data!.docs[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          elevation: 5,
                          child: ListTile(
                              title: Text(
                                documentSnapshot['name'],
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(
                                documentSnapshot['position'],
                                style: TextStyle(color: Colors.grey),
                              ),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        updateData(documentSnapshot);
                                      },
                                      icon: Icon(Icons.edit)),
                                  IconButton(
                                      onPressed: () {
                                        delete(documentSnapshot.id);
                                      },
                                      icon: Icon(Icons.delete)),
                                ],
                              )),
                        ),
                      );
                    },
                  ),
                );
              }
              return Center(child: Text('No DATA'));
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.primaryColor,
        onPressed: () {
          create();
        },
        child: Icon(
          Icons.add,
          color: AppColors.witheText,
        ),
      ),
    );
  }

  Widget myDialoge({
    required String name,
    required String condition,
    required VoidCallback onpress,
  }) =>
      Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(name, style: TextStyle(fontSize: 18)),
              SizedBox(height: 8),
              TextField(
                controller: nameContoller,
                decoration: InputDecoration(
                  hintText: 'e.g. John',
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: 'Enter Name',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: positionContoller,
                decoration: InputDecoration(
                  hintText: 'e.g. Developer',
                  hintStyle: TextStyle(color: Colors.grey),
                  labelText: 'Enter Position',
                  labelStyle: TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(onPressed: onpress, child: Text(condition)),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Cancel'),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
