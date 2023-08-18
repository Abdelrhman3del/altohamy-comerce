import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  List allData = [];
  CollectionReference collectionReference =
      FirebaseFirestore.instance.collection('catogery');

  Future getData() async {
    var response = await collectionReference.get();
    response.docs.forEach((element) {
      allData.add(element.data());
    });
    print(allData);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
        itemBuilder: (context, i) {
          return Container(
            height: 230,
            width: 22,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 200,
                  width: 600,
                  child: Image.network('${allData[i]['imge']}'),
                ),
                Text(
                  '${allData[i]['name']}',
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 20),
                )
              ],
            ),
          );
        },
        itemCount: allData.length,
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            height: 20,
          );
        },
      ),
    );
  }
}
