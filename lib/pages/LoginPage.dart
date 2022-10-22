import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../pages/forgot_password_page.dart';

class LoginPage extends StatefulWidget {
  //esta es la pagina principal de nuestro login, aca es donde el usuario tanto decidira o iniciar sesion si tiene una cuenta, o registarse para iniciar sesion
  final VoidCallback showRegisterPage;
  //VoidCallback es una función que no toma parámetros y no devuelve parámetros

  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  Future logIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      //Creamos las variables que vamos a utilizar tanto el email como la contraseña
    );
  }


  @override
  void dispose() {
    //dispose, este metodo se utiliza cuando se quiere eliminar algo y no se quiere ver mas.

    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }


  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              const Icon(Icons.adb, size: 100),
              const SizedBox(height: 75),
               Text('¡Hola Aprendiz!',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 50,
                  )),
              const SizedBox(height: 10),
              const Text(
                'BIENVENIDO',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 20),
                  //damos estilo a los valores que se van a insertar, y los parametros que se reciben

                  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _emailController,

                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      fillColor: Colors.grey[200],
                      hintText: 'Email',
                      filled: true),
                ),
              ),
              const SizedBox(height: 20),
                  //damos estilo a los valores que se van a insertar, y los parametros que se reciben

                  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _passwordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Password',
                      fillColor: Colors.grey[200],
                      filled: true),
                ),
              ),
              const SizedBox(height: 10),   //damos estilo a los valores que se van a insertar, y los parametros que se reciben

                  Padding(padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){
                        Navigator.push(
                          context, MaterialPageRoute(builder: (context){
                            return ForgotPasswordPage();
                        }),
                        );
                      },
                      child: const Text('¿Olvido la contraseña?',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold
                      ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 20),
                  //damos estilo a los valores que se van a insertar, y los parametros que se reciben

                  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: GestureDetector(
                  onTap: logIn,
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Iniciar Sesión',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
                  //damos estilo a los valores que se van a insertar, y los parametros que se reciben

                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:  <Widget>[
                  const Text(
                    '¿No tienes cuenta? ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: widget.showRegisterPage,
                  child: const Text(
                    ' ¡Registrate ahora!',
                      //damos estilo a los valores que se van a insertar, y los parametros que se reciben

                      style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold)
                  ),
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }


}
