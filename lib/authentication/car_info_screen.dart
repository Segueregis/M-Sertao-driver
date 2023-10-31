import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../global/global.dart';
import '../splashScreen/splash_screen.dart';

class CarInfoScreen extends StatefulWidget
{


  @override
  State<CarInfoScreen> createState() => _CarInfoScreenState();
}


class _CarInfoScreenState extends State<CarInfoScreen>
{
  TextEditingController carModelTextEditingController = TextEditingController();
  TextEditingController carNumberTextEditingController = TextEditingController();
  TextEditingController carColorTextEditingController = TextEditingController();


  List<String> carTypesList = ["uber-x", "uber-go", "bike"];
  String? selectedCarType;



  saveCarInfo()
  {
    Map driverCarInfoMap =
    {
      "car_color": carColorTextEditingController.text.trim(),
      "car_number": carNumberTextEditingController.text.trim(),
      "car_model": carModelTextEditingController.text.trim(),
      "type": selectedCarType,
    };

    DatabaseReference driversRef = FirebaseDatabase.instance.ref().child("Motos");
    driversRef.child(currentFirebaseUser!.uid).child("detalhe_motos").set(driverCarInfoMap);

    Fluttertoast.showToast(msg: "Os detalhes do carro foram salvos, parabéns.");
    Navigator.push(context, MaterialPageRoute(builder: (c)=> const MySplashScreen()));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: const Color(0xfff9c900), // Cor de fundo sólida (mostarda)
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                const SizedBox(
                  width: double.infinity,
                  height: 200.0, // Height of the background container
                ),
                Container(
                  width: 250.0,
                  height: 150.0, // Height of the image
                  margin: const EdgeInsets.only(top: 50.0), // Top space
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0), // Rounded corners
                  ),
                  child: const Image(
                    image: AssetImage("images/logo_moto_amarela.png"),
                    fit: BoxFit.cover, // Fit the image within the container
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 200.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40),
                color: Colors.white,
              ),
              height: 500,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    TextField(
                      controller: carModelTextEditingController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold, // Adicione essa linha para definir a fonte em negrito
                      ),
                      decoration: const InputDecoration(
                        labelText: "Modelo da Moto",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ),

                    TextField(
                      controller: carNumberTextEditingController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold, // Adicione essa linha para definir a fonte em negrito
                      ),
                      decoration: const InputDecoration(
                        labelText: "Placas de Moto",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ),

                    TextField(
                      controller: carColorTextEditingController,
                      keyboardType: TextInputType.text,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold, // Adicione essa linha para definir a fonte em negrito
                      ),
                      decoration: const InputDecoration(
                        labelText: "Cor da Moto",
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 15,
                        ),
                        labelStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 18,
                        ),
                      ),
                    ),

                    const SizedBox(height: 10,),

                    DropdownButton(
                      iconSize: 26,
                      dropdownColor: Colors.black,
                      hint: const Text(
                        "Escolha o tipo de Moto",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.grey,
                        ),
                      ),
                      value: selectedCarType,
                      onChanged: (newValue)
                      {
                        setState(() {
                          selectedCarType = newValue.toString();
                        });
                      },
                      items: carTypesList.map((car){
                        return DropdownMenuItem(
                          child: Text(
                            car,
                            style: const TextStyle(color: Colors.grey),
                          ),
                          value: car,
                        );
                      }).toList(),
                    ),

                    const SizedBox(height: 20,),

                    ElevatedButton(
                      onPressed: ()
                      {
                        if(carColorTextEditingController.text.isNotEmpty
                            && carNumberTextEditingController.text.isNotEmpty
                            && carModelTextEditingController.text.isNotEmpty
                            && selectedCarType != null)
                        {
                          saveCarInfo();
                        }
                        validateForm();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xfff9c900),

                      ),
                      child: const Text(
                        "Salve Agora",
                        style: TextStyle(
                          color: Colors.black54,
                          fontSize: 20,
                        ),
                      ),
                    ),





                  ],
              ),
            ),
          ),
          ),],
      ),
    );
  }

  void validateForm() {}
}
