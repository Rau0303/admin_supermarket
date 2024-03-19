import 'package:admin_supermarket/screens/main/home_screen.dart';
import 'package:flutter/material.dart';

import '../../widgets/passwordTextField_widget.dart';
import '../../widgets/saveButton_widget.dart';
import '../../widgets/usernameTextField_widget.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    void login(){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> HomeScreen()));
    }

    void register(){}

    void loginForPhone(){}

    return Scaffold(
      body: Stack(
        children: [
          
          Positioned(
            top: 0,
            height: screenSize.height * 0.6,
            width: screenSize.width,
            child: Container(
              color: Colors.black,
            ),
          ),
          Positioned(
            top: screenSize.height * 0.1,
            left: 0,
            right: 0,
            child: Image.asset(
              'assets/logoAdmin.jpg',
              width: 100,
              height: 100,
            ),
          ),


          Positioned(
            top: screenSize.height * 0.25,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30)
              ),
              child: Container(
                width: screenSize.width ,
                height: screenSize.height * 0.8,
                  color: Colors.white,
                child: Stack(
                  children: [

                    Positioned(
                      top: screenSize.height * 0.05,
                      left: 0,
                      right: 0,
                      child: Text(
                        "Вход",
                        style: textTheme.displayMedium,
                        textAlign: TextAlign.center,
                      ),
                    ),


                    Positioned(
                      top: screenSize.height * 0.2,
                      left: screenSize.width * 0.03,
                      right: screenSize.width * 0.03,
                      child: UsernameTextField_widget(usernameController: _usernameController),
                    ),

                    Positioned(
                      top: screenSize.height * 0.28,
                      left: screenSize.width * 0.03,
                      right: screenSize.width * 0.03,
                      child: PasswordTextField_widget(passwordController: _passwordController, hintText: 'Введите пароль',),
                    ),


                    Positioned(
                      top: screenSize.height * 0.4,
                      left: screenSize.width * 0.03,
                      right: screenSize.width * 0.03,
                      child: SaveButton_widget(screenSize: screenSize, textTheme: textTheme, onPressed: login, text: 'Войти',),
                    ),


                     Positioned(
                       top: screenSize.height * 0.47,
                       left: screenSize.width * 0.03,
                       right: screenSize.width * 0.03,
                       child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text("нет аккаунта? ",style: textTheme.displaySmall,),
                          TextButton(
                              onPressed: register,
                              child: Text("Зарегистрироваться!"))
                        ],
                    ),
                     ),



                    Positioned(
                      top: screenSize.height * 0.55,
                      left: screenSize.width * 0.03,
                      right: screenSize.width * 0.03,
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /*Divider(
                            color: Colors.black,
                            height: 2,
                            thickness: 2,
                          ),*/
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8),
                            child: Text(
                              "Или",
                              style: TextStyle(fontSize: 16,color: Colors.black),
                            ),
                          ),
                          /*Divider(
                            color: Colors.black,
                            height: 2,
                            thickness: 2,
                          ),*/
                        ],
                      )

                    ),



                    Positioned(
                      top: screenSize.height * 0.6,
                      left: screenSize.width * 0.03,
                      right: screenSize.width * 0.03,
                      child: IconButton(
                          onPressed: loginForPhone,
                          icon: Icon(Icons.phone_android,size: 50,),),
                    )



                  ],
                ),
              ),

            ),
          ),





        ],
      )
    );
  }
}






