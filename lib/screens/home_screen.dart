import 'package:flutter/material.dart';
import 'package:untitled/widgets/main_button.dart';
import 'package:untitled/logic/animal_helper.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _currentAnimal = AnimalHelper.animals['dog']!;

  void _setAnimal(String _name) {
    setState(() {
      _currentAnimal = AnimalHelper.animals[_name]!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              'Animals',
              style: TextStyle(
                fontSize: 40,
              ),
            ),
          ),
          elevation: 0,
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, _) {
            if (MediaQuery.of(context).orientation == Orientation.portrait) {
              return _mainBuilder(1);
            } else {
              return _mainBuilder(2);
            }
          },
        ));
  }

  _mainBuilder(crossAxisCount) {
    var deviceWidth = MediaQuery.of(context).size.width;
    if (MediaQuery.of(context).orientation != Orientation.portrait) {
      deviceWidth = MediaQuery.of(context).size.height;
    }

    return Container(
      margin: const EdgeInsets.all(20),
      child: GridView.count(
          scrollDirection: Axis.vertical,
          crossAxisCount: crossAxisCount,
          children: [
            ListView(
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Image.network(
                      _currentAnimal['image']!,
                      height: deviceWidth * 0.75,
                      width: deviceWidth * 0.75,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      _currentAnimal['description']!,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            GridView.count(
                scrollDirection: Axis.horizontal,
                crossAxisCount: 2,
                children: [
                  MainButton(action: () => _setAnimal('dog'), text: 'Dog'),
                  MainButton(
                      action: () => _setAnimal('racoon'), text: 'Racoon'),
                  MainButton(action: () => _setAnimal('cat'), text: 'Cat'),
                  MainButton(
                      action: () => _setAnimal('monkey'), text: 'Monkey'),
                ]),
          ]),
    );
  }
}
