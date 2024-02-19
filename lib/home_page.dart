import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var _costController = TextEditingController();
  bool _isRoundedRequested = false; // para redondear propina
  int? _currentRadio; // indica el radio marcado como seleccionado

  var _radioGroupValues = {
    // contenido en texto de los radios
    0: "Amazing 20%",
    1: "Good 18%",
    2: "Ok 15%",
  };

  var _radioGroupAssets = {
    // TODO: complete el contenido de assets para los radios
    0: "assets/",
    1: "assets/",
    2: "assets/",
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tip Time'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 14),
          ListTile(
            leading: Icon(Icons.room_service),
            title: Padding(
              padding: EdgeInsets.only(right: 24),
              child: TextField(), // TODO: agrega controller y decoracion
            ),
          ),
          ListTile(
            leading: Icon(Icons.dinner_dining),
            title: Text("How was the service?"),
          ),
          // TODO: agregar el grupo de radios
          // TODO: agregar el switch
          MaterialButton(
            child: Text("CALCULATE"),
            onPressed: () {
              // TODO: llamar a tip calculation
            },
          ),
          Text("Tip amount: \$22"),
        ],
      ),
    );
  }

  // TODO: crear un grupo de N radios en base a N datos que queramos listar
  List<ListTile> radioGroupGenerator() {
    return [];
  }

  void setIsRoundedSelected(bool updatedSwitchValue) {
    // TODO: actualizar el valor "isRoundedRequested" en base a la seleccion del usuario
  }

  void setSelectedRadio(int? updatedRadioValue) {
    // TODO: actualizar el valor "currentRadio" en base a la seleccion del usuario
  }

  void tipCalculation(double dato) {
    // TODO: completar metodo para calcular cuanta propina se dejara
  }
}
