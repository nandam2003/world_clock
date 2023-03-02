import 'package:flutter/material.dart';
import 'package:world_clock/api_service.dart';
import 'package:world_clock/json_to_dart.dart';
import 'util.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Data data = Data();
  Future<Time>? fetchData;
  TextEditingController _textContinent = TextEditingController();
  TextEditingController _textCountry = TextEditingController();

  @override
  void dispose(){
    _textCountry.dispose();
    _textContinent.dispose();
    super.dispose();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('World Clock'),
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _textContinent,
                decoration: const InputDecoration(
                  hintText: 'Continent',
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: TextField(
                controller: _textCountry,
                decoration: const InputDecoration(
                  hintText: 'Enter Country',
                ),
              ),
            ),
            TextButton(
                onPressed: (){
                  setState(() {
                    fetchData = data.fetchDateTime(continent: _textContinent.text.capitalize(),country: _textCountry.text.capitalize());
                  });
                },
                child: const Text('click me'),
            ),
            FutureBuilder(
              future: fetchData,
                builder: (context,snapshot){
                if(snapshot.hasData){
                  return Column(
                    children: [
                      Text('Date: ${snapshot.data?.date}'),
                      Text('Time: ${snapshot.data?.time}'),
                    ],
                  );
                }else {
                  return Text('');
                }


                },

            )

          ],
        ),
      ),
    );
  }
}

