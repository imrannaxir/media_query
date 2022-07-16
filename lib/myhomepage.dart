import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var clientHeight = size.height - kToolbarHeight;

    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            widget.title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: const [
          Icon(
            Icons.search,
            size: 32,
          ),
        ],
      ),

      body: myMediaQuery(clientHeight, size),
      floatingActionButton: myFloatingActionButton(),
      bottomNavigationBar: myBottomNavigationBar(clientHeight),
      drawer: myDrawer(),
    );
  }

  Widget myMediaQuery(var clientHeight , var size ){
    return Column(
      children: [
        Container(
          height: clientHeight*0.3,
          color: Colors.blue,
        ),
        SizedBox(
          height: clientHeight*0.6,
          child: Row(
          children: [
            Container(
              height: double.infinity,
              width: size.width*0.5,
              color: Colors.orange,
            ),
            Container(
              height: double.infinity,
              width: size.width*0.5,
              color: Colors.blueGrey,
            ),
          ],
          ),
        ),
      ],
    );
  }

  Widget myFloatingActionButton(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
        ),
        FloatingActionButton(onPressed: _decrementCounter,
        tooltip: 'Decrement',
          child: const Icon(Icons.remove),
        ),
      ],
    );
  }

  Widget myBottomNavigationBar(var clientHeight){
    return Container(
      height: clientHeight*0.1,
      color: Colors.pink,
      child: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home),label: 'Home Page',),
          BottomNavigationBarItem(icon: Icon(Icons.work_sharp),label: 'Work_Sharp'),
          BottomNavigationBarItem(icon: Icon(Icons.account_circle),label: 'Account')
        ],
      ),
    );
  }

  Widget myDrawer() {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.green,
            child: const DrawerHeader(
              child: Center(
                child: Text(
                  'Drawer Header',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(50),
            child: Text(
              'LOG_IN',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          const Text(
            'SIGN_UP',
            style: TextStyle(
                color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 50),
            child: ListTile(
              leading: Icon(
                Icons.account_balance,
                size: 32,
              ),
              title: Text(
                'My Account',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              trailing: Icon(
                Icons.delete,
                size: 32,
              ),
            ),
          )
        ],
      ),
    );
  }
}
