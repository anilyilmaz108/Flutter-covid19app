import 'package:covid19/components/info_widget.dart';
import 'package:covid19/components/my_custom_clipper.dart';
import 'package:covid19/components/my_material_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class InfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipPath(
              clipper: MyCustomClipper(),
              child: Image.network(
                'https://www.mlsaturkey.com/wp-content/uploads/2020/05/yerel-basin-2.jpg',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 8.0),
              child: Text(
                'Covid 19 Belirtileri',
                style: TextStyle(
                  fontSize: 20,

                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyMaterialIcon(
                  icon: FontAwesomeIcons.headSideMask,
                  color: Colors.lightGreen,
                ),
                MyMaterialIcon(
                  icon: FontAwesomeIcons.handshakeAltSlash,
                  color: Colors.orangeAccent,
                ),
                MyMaterialIcon(
                  icon: FontAwesomeIcons.handsWash,
                  color: Colors.lightBlueAccent,
                ),
              ],
            ),
            InfoWidget(
              image: 'https://static.vecteezy.com/system/resources/previews/001/308/701/non_2x/young-boy-wears-face-mask-to-fight-covid-19-vector.jpg',
              title: 'Maske Kullanın',
              subtitle: 'sosyal hayatın içerisindeyken, çevrenizdekilerle aranızdaki fiziksel mesafeyi korumaya özen göstererek, bir yüz maskesi kullanmanız, genel sağlığınızı korumanız açısından fark yaratacaktır.',
            ),
            InfoWidget(
              image: 'https://i.etsystatic.com/23821301/r/il/e57f08/2484188514/il_300x300.2484188514_vebl.jpg',
              title: 'Sosyal Mesafenizi Koruyun',
              subtitle: 'Maske takar ve 1,5 metre sosyal mesafeyi korursanız Kovid-19 virüsünün yayılmasını azaltabilirsiniz.',
            ),
            InfoWidget(
              image: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQSZMUBJcSu-mJvX1H6r9hIy8oZmvVUVx6ZSg&usqp=CAU',
              title: 'Ellerinizi Yıkayın',
              subtitle: 'Elleri temizlerken antibakteriyel içeren sabun kullanmaya gerek yoktur, normal sabun yeterlidir. Ellerin su ve sabunla yeterli sürede, doğru teknikle yıkanması korunmayı artırmak için önemlidir.',
            ),
          ],
        ),
      ),
    );
  }
}






