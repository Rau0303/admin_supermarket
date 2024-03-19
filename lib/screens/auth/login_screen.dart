import 'package:flutter/material.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final textTheme = Theme.of(context).textTheme;
    TextEditingController _usernameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

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
              'assets/logoAdmin.jpg', // замените путь на путь к вашему логотипу
              width: 100, // задайте нужную ширину логотипа
              height: 100, // задайте нужную высоту логотипа
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
                      left: screenSize.width * 0.38,
                      child: Text("Вход",
                      style: textTheme.displayMedium
                      ),
                    ),

                    Positioned(
                      top: screenSize.height * 0.2,
                      left: screenSize.width * 0.03,
                      right: screenSize.width * 0.03,
                      child: TextFormField(
                        controller: _usernameController,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          )
                        ),
                      ),
                    ),

                    Positioned(
                      top: screenSize.height * 0.28,
                      left: screenSize.width * 0.03,
                      right: screenSize.width * 0.03,
                      child: TextFormField(
                        controller: _passwordController,
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: "password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                          )
                        ),
                      ),
                    ),
                    Positioned(
                      top: screenSize.height * 0.4,
                      left: screenSize.width * 0.03,
                      right: screenSize.width * 0.03,
                      child: SizedBox(
                        height: screenSize.height * 0.07,
                        child: ElevatedButton(
                            onPressed: (){},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
                                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      bottomLeft: Radius.circular(10),
                                      bottomRight: Radius.circular(10),
                                    ),)
                                ),
                            ),
                            child: Text("Войти",style: textTheme.bodyMedium,)),
                      ),
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
                              onPressed: (){},
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
                          onPressed: (){},
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
