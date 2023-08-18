import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  List allData = [];
  CollectionReference collectionReference =
  FirebaseFirestore.instance.collection('home');

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
        body:StreamBuilder(
          stream: FirebaseFirestore.instance.collection('home').snapshots(),
          builder: (context,snapShot){
            if(snapShot.hasData){
              return  GridView.builder(
                itemCount: allData.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    mainAxisSpacing: 10, crossAxisCount: 2, crossAxisSpacing: 0),
                itemBuilder: (context, i) => Container(
                  child: Column(
                    children: [
                      SizedBox(
                          width: 200,
                          height: 130,
                          child: Image.network(allData[i]['imge'])),
                      Text(
                        allData[i]['desc'],
                        style: const TextStyle(
                            textBaseline: TextBaseline.alphabetic,
                            overflow: TextOverflow.ellipsis),

                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('price'),
                          Text("${allData[i]['price']} \$ ",style: TextStyle(fontWeight: FontWeight.bold),)
                        ],
                      )
                    ],
                  ),
                ),
              );
            }else{
              return const Center(
                child: CircularProgressIndicator(

                  color: Colors.purple,
                ),
              );
            }

          },
        )


    );
  }
}
