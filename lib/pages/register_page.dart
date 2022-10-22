import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterPage extends StatefulWidget {
  //tenemos nuestro registrer, y tenemos que saber que para que cargue tiene que haber una variable que cargue nuestro login, o inicio de sesion, en este caso es showLoginPage
  final VoidCallback showLoginPage;
  //VoidCallback es una función que no toma parámetros y no devuelve parámetros
  const RegisterPage({Key? key, required this.showLoginPage}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  //creamos nuestras variables las cuales utilizaremos para registrar a un usuario o bueno para grabar sus datos.
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _userProfileController = TextEditingController();
  //TextEditingController, cambia el texto por un campo de texto

  Future singIn() async {
    //el widget FutureBuilder se usa para crear widgets basados ​​en la última instantánea de interacción con un futuro

   //async, estamos diciendo que esta es una funcion asincreonica
    if (passwordConfirmed()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );
      addUserDetails(
          _firstNameController.text.trim(),
          _lastNameController.text.trim(),
          _userProfileController.text.trim(),
          _emailController.text.trim());
    }
  }

  Future addUserDetails(
    String firstName,
    String LastName,
    String userProfile,
    String email,
      //creamos el constructor y le damos los parametros que tiene cada una de las variables
  ) async {
    await FirebaseFirestore.instance.collection('lacuenta').add({
      'First name': firstName,
      'Last name': LastName,
      'User profile': userProfile,
      'Email': email,
    });
  }

  bool passwordConfirmed() {
    //El metodo trim La cadena sin ningún espacio en blanco inicial y posterior. "recordar"
    if (_passwordController.text.trim() ==
        _confirmPasswordController.text.trim()) {
      return true;
    } else {
      return false;
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _firstNameController.dispose();
    _lastNameController.dispose();
    _userProfileController.dispose();
//dispose, este metodo se utiliza cuando se quiere eliminar algo y no se quiere ver mas.
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(

        // Un widget que inserta a su hijo con suficiente relleno para evitar intrusiones por parte del sistema operativo
        child: Center(
          child: SingleChildScrollView(
              //es para dar un SingleChildScrollView
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
             //mainAxisAlignment para ocupar todo el eje central de la pagina
              const Icon(Icons.adb, size: 100),
              const SizedBox(height: 75),
              Text('¡Hola Aprendiz!',
                  style: GoogleFonts.bebasNeue(
                    fontSize: 50,
                  )),
              const SizedBox(height: 10),
              const Text(
                'Registre sus datos a continuación',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _firstNameController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      fillColor: Colors.grey[200],
                      hintText: 'First Name',
                      filled: true),
                ),
                //damos estilo a los valores que se van a insertar, y los parametros que se reciben
              ),
              const SizedBox(height: 10),
                  //damos estilo a los valores que se van a insertar, y los parametros que se reciben

                  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _lastNameController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Last Name',
                      fillColor: Colors.grey[200],
                      filled: true),
                ),
              ),
              const SizedBox(height: 10),
                  //damos estilo a los valores que se van a insertar, y los parametros que se reciben

                  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                    controller: _userProfileController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.deepPurple),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        fillColor: Colors.grey[200],
                        hintText: 'User profile',
                        filled: true)),
              ),
              const SizedBox(height: 10),
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
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Email',
                      fillColor: Colors.grey[200],
                      filled: true),
                ),
              ),
              const SizedBox(height: 10),
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
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Password',
                      fillColor: Colors.grey[200],
                      filled: true),
                ),
              ),
              const SizedBox(height: 10),
                  //damos estilo a los valores que se van a insertar, y los parametros que se reciben

                  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  controller: _confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.deepPurple),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      hintText: 'Confirm Password',
                      fillColor: Colors.grey[200],
                      filled: true),
                ),
              ),
              const SizedBox(height: 20),
                  //damos estilo a los valores que se van a insertar, y los parametros que se reciben

                  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: GestureDetector(
                  onTap: singIn,
                  child: Container(
                    padding: const EdgeInsets.all(15.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(
                      child: Text(
                        'Registrarse ahora!',
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
              const SizedBox(height: 30),
                  //damos estilo a los valores que se van a insertar, y los parametros que se reciben

                  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    '¡Soy miembro! ',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                      onTap: widget.showLoginPage,
                      child: const Text(
                        ' Iniciar Sesión',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ))
                ],
              ),
              const SizedBox(height: 20),
            ]),
          ),
        ),
      ),
    );
  }
}
