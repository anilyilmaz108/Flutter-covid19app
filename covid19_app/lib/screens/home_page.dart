import 'package:covid19/components/my_material_widget.dart';
import 'package:covid19/screens/data_page.dart';
import 'package:covid19/screens/info_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('COVID 19 APP'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyMaterialWidget(
                  icon: FontAwesomeIcons.home,
                  color: Colors.lightBlueAccent,
                  title: 'Anasayfa',
                  onPress: (){
                    var snackBar = SnackBar(
                      duration: Duration(milliseconds: 800),
                      content: Text('Zaten Anasayfadasınız.'),
                      backgroundColor: Colors.blue,
                      elevation: 4.0,

                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  },
                ),
                MyMaterialWidget(
                  icon: FontAwesomeIcons.infoCircle,
                  color: Colors.green,
                  title: 'Veriler',
                  onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => DataPage()));
                  },
                )
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                MyMaterialWidget(
                  icon: FontAwesomeIcons.questionCircle,
                  color: Colors.yellow,
                  title: 'Bilgi',
                  onPress: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => InfoPage()));
                  },
                ),
                MyMaterialWidget(
                  icon: FontAwesomeIcons.signOutAlt,
                  color: Colors.redAccent,
                  title: 'Çıkış',
                  onPress: (){
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  },
                )

              ],
            ),
          ],
        )
      ),
    );
  } 
}


