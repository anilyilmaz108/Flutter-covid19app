import 'package:covid19/components/my_textfield_widget.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class DataPage extends StatefulWidget {
  @override
  _DataPageState createState() => _DataPageState();
}

class _DataPageState extends State<DataPage> {

  @override

  String patients;
  String totalPatients;
  String deaths;
  String totalDeaths;
  String recovered;
  String totalRecovered;
  String tests;
  String totalTests;

  String gun = '11';
  String ay = '03';
  String yil = '2020';

  Future<void> getData()async {
    var data = await http.get(
        'https://raw.githubusercontent.com/ozanerturk/covid19-turkey-api/master/dataset/timeline.json');
    var dataParsed = jsonDecode(data.body);
    setState(() {
      patients = dataParsed['$gun/$ay/$yil']['patients'];
      totalPatients = dataParsed['$gun/$ay/$yil']['totalPatients'];
      deaths = dataParsed['$gun/$ay/$yil']['deaths'];
      totalDeaths = dataParsed['$gun/$ay/$yil']['totalDeaths'];
      recovered = dataParsed['$gun/$ay/$yil']['recovered'];
      totalRecovered = dataParsed['$gun/$ay/$yil']['totalRecovered'];
      tests = dataParsed['$gun/$ay/$yil']['tests'];
      totalTests = dataParsed['$gun/$ay/$yil']['totalTests'];
    });

  }

  void initState() {
    getData();
    super.initState();
  }

  TextEditingController gunController = TextEditingController();
  TextEditingController ayController = TextEditingController();
  TextEditingController yilController = TextEditingController();

  @override

  Widget build(BuildContext context) {
    return yil == null || ay == null || gun == null ? CircularProgressIndicator() : Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('COVID 19 Tablosu'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 14.0,
              right: 8.0,
              left: 8.0
            ),
            child: Row(
              children: [
                MyTextFieldWidget(gunController: gunController, title: 'gün',),
                SizedBox(width: 10,),
                MyTextFieldWidget(gunController: ayController, title: 'ay',),
                SizedBox(width: 10,),
                MyTextFieldWidget(gunController: yilController, title: 'yıl',),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                elevation: 5.0,
                shape: BeveledRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0),
                )
              ),
                onPressed: ()async{
                  gun = gunController.text;
                  ay = ayController.text;
                  yil = yilController.text;
                  setState(() {});
                  var data = await http.get(
                      'https://raw.githubusercontent.com/ozanerturk/covid19-turkey-api/master/dataset/timeline.json');
                  var dataParsed = jsonDecode(data.body);
                  setState(() {
                    patients = dataParsed['$gun/$ay/$yil']['patients'];
                    totalPatients = dataParsed['$gun/$ay/$yil']['totalPatients'];
                    deaths = dataParsed['$gun/$ay/$yil']['deaths'];
                    totalDeaths = dataParsed['$gun/$ay/$yil']['totalDeaths'];
                    recovered = dataParsed['$gun/$ay/$yil']['recovered'];
                    totalRecovered = dataParsed['$gun/$ay/$yil']['totalRecovered'];
                    tests = dataParsed['$gun/$ay/$yil']['tests'];
                    totalTests = dataParsed['$gun/$ay/$yil']['totalTests'];
                  });
                },
                child: Text('Ara')
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Align(
              alignment: Alignment.topLeft,
                child: Text(
                    '$gun/$ay/$yil',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                )
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: DataTable(
              columns: [
                DataColumn(label: Text(
                    'Veriler',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                )),
                DataColumn(label: Text(
                    'Günlük',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                )),
                DataColumn(label: Text(
                    'Toplam',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                )),
              ],
              rows: [
                DataRow(cells: [
                  DataCell(Text('Test')),
                  DataCell(Text('$tests')),
                  DataCell(Text('$totalTests')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Hasta')),
                  DataCell(Text('$patients')),
                  DataCell(Text('$totalPatients')),
                ]),
                DataRow(cells: [
                  DataCell(Text('Vefat')),
                  DataCell(Text('$deaths')),
                  DataCell(Text('$totalDeaths')),
                ]),
                DataRow(cells: [
                  DataCell(Text('İyileşen')),
                  DataCell(Text('$recovered')),
                  DataCell(Text('$totalRecovered')),
                ]),

              ],
            ),
          )
        ],
      ),
    );
  }
}


