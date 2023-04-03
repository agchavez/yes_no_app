import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int _count = 0;

  void _resetCounter() {
    setState(() {
      _count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.all(4.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(
                'https://resources.premierleague.com/premierleague/photos/players/250x250/p14937.png'),
          ),
        ),
        title: const Center(
          child: Text(
            'Gabriel Chavez',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        actions: [
          IconButton(
            color: Colors.blue,
            onPressed: _resetCounter,
            icon: const Icon(Icons.call),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
                child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                  child: Row(
                    mainAxisAlignment: index % 2 == 0
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.end,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text('Hola gabriel chavez',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          )),
                    ],
                  ),
                );
              },
            )),
            Text(
              'Aqui va el contador: $_count',
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          CustomButton(
            icon: Icons.add,
            onPressed: () {
              setState(() {
                _count++;
              });
            },
            tooltip: 'Increment',
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            icon: Icons.remove,
            onPressed: () {
              setState(() {
                _count--;
              });
            },
            tooltip: 'Decrement',
          ),
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;
  final String? tooltip;

  const CustomButton({
    Key? key,
    required this.icon,
    required this.onPressed,
    this.tooltip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.blue,
      onPressed: onPressed,
      tooltip: tooltip,
      child: Icon(icon),
    );
  }
}
