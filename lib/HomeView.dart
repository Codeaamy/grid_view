import 'package:drag_and_drop_gridview/devdrag.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int variableSet = 0;
  ScrollController _scrollController;
  double width;
  double height;

  List<String> _images = [
    'images/ant_man.jpg',
    'images/avengers_endgame.jpg',
    'images/deadpool.jpg',
    'images/doctor_strange.jpg',
    'images/hulk.jpg',
    'images/ironman.jpg',
    'images/ironman_2.jpg',
    'images/ironman_3.jpg',
    'images/spiderman_far_from_home.jpg',
    'images/spiderman_homecoming.jpg',
    'images/thor.jpg',
    'images/x_men.jpg',
  ];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MCU', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: DragAndDropGridView(
            onWillAccept: (oldIndex, newIndex){
              return true;
            },
            onReorder: (oldIndex, newIndex){

              int indexOfFirstItem = _images.indexOf(_images[oldIndex]);
              int indexOfSecondItem = _images.indexOf(_images[newIndex]);

              if (indexOfFirstItem > indexOfSecondItem) {
                for (int i = _images.indexOf(_images[oldIndex]);
                i > _images.indexOf(_images[newIndex]);
                i--) {
                  var tmp = _images[i - 1];
                  _images[i - 1] = _images[i];
                  _images[i] = tmp;
                }
              } else {
                for (int i = _images.indexOf(_images[oldIndex]);
                i < _images.indexOf(_images[newIndex]);
                i++) {
                  var tmp = _images[i + 1];
                  _images[i + 1] = _images[i];
                  _images[i] = tmp;
                }
              }
              setState(() {});

            },
          controller: _scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3.3 / 4.7,
            ),

          itemCount: _images.length,
          itemBuilder: (context, index){

              return LayoutBuilder(
                builder: (context, costrains){
                  if (variableSet == 0) {
                    height = costrains.maxHeight;
                    width = costrains.maxWidth;
                    variableSet++;
                  }
                  return GridTile(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: width,

                        decoration: BoxDecoration(
                            color: Colors.black,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white.withOpacity(0.2),
                                  offset: Offset(0,0),
                                  blurRadius: 1.0,
                                  spreadRadius: 3
                              )
                            ],
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            image: DecorationImage(
                                image: AssetImage('${_images[index]}')
                            )
                        ),
                      ),
                    ),
                  );
                },

              );
          },
        ),
      ),
    );
  }
}
