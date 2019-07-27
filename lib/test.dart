import 'package:flutter/material.dart';

class TestPage extends StatelessWidget {

  ScrollController controller = new ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: <Widget>[
                Flexible(
                  child: Container(
                    color: Colors.green,
                    child: listView(),
                  ),
                ),
//                Flexible(
//                  child: Container(
//                    color: Colors.red,
//                      child: listView(),
//                  ),
//                ),
//              Flexible(
//                child: Container(
//                  height: 100.0,
//                  color: Colors.blue,
//                ),
//              ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listView(){
    print('object');
    return ListView.separated(
        controller: controller,
        shrinkWrap: true,
        itemCount: 100,
        separatorBuilder: (BuildContext context, int index){
          print("separate" + index.toString());
          if(index==98){
            return listView2();
          } else {
            return SizedBox();
          }
        },
        itemBuilder: (BuildContext context, int index){
          print(index.toString() + " built");
          return Card(
            child: Container(
              color: Colors.white,
              height: 30.0,
              width: MediaQuery.of(context).size.height,
              child: Text(index.toString()),
            ),
          );
        },
    );
  }

  Widget listView2(){
    print('object');
    return ListView.builder(
      controller: controller,
      shrinkWrap: true,
      itemCount: 100,
      itemBuilder: (BuildContext context, int index){
        print(index.toString() + " 2 built");
        return Card(
          child: Container(
            color: Colors.white,
            height: 30.0,
            width: MediaQuery.of(context).size.height,
            child: Text(index.toString()),
          ),
        );
      },
    );
  }
}
