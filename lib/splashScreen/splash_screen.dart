import 'dart:async';
import 'package:flutter/material.dart';
import 'package:moto_sertao_flutter_drivers/authentication/login_screen.dart';
import '../global/global.dart';
import '../mainScreens/main_screen.dart';




class MySplashScreen extends StatefulWidget
{
  const MySplashScreen({Key? key}) : super(key: key);

  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}



class _MySplashScreenState extends State<MySplashScreen>
{

  startTimer()
  {
    Timer(const Duration(seconds: 3), () async
    {
      if(await fAuth.currentUser != null)
      {
        currentFirebaseUser = fAuth.currentUser;
        Navigator.push(context, MaterialPageRoute(builder: (c)=>  MainScreen()));  //envia o usuário para a tela principal
      }
      else
      {//envia o usuário para a tela Login
        Navigator.push(context, MaterialPageRoute(builder: (c)=>  const LoginScreen()));

      }
    });
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  @override
  Widget build(BuildContext context)
  {
    return Material(
      child: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xfff9c900), // Cor de fundo sólida (mostarda)
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Image.asset("images/logo_moto_amarela.png"),

              const SizedBox(height: 10,),

              const Text(
                "Seja Bem-vindo, meu Rei",
                style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
