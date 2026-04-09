import 'package:flutter/material.dart';
import 'crear_rutina_screen.dart';

class RegistroUsuarioScreen extends StatefulWidget {
  const RegistroUsuarioScreen({super.key});

  @override
  State<RegistroUsuarioScreen> createState() =>
      _RegistroUsuarioScreenState();
}

class _RegistroUsuarioScreenState
    extends State<RegistroUsuarioScreen> {

  final _formKey = GlobalKey<FormState>();

  final nombreCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  void dispose() {
    nombreCtrl.dispose();
    emailCtrl.dispose();
    passCtrl.dispose();
    super.dispose();
  }

  void registrar() {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) =>
              CrearRutinaScreen(usuario: nombreCtrl.text),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,

      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0F2027),
              Color(0xFF203A43),
              Color(0xFF2C5364),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior:
                ScrollViewKeyboardDismissBehavior.onDrag,

            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                children: [

                  const SizedBox(height: 30),

                  // ICONO
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 12,
                          offset: Offset(0, 6),
                        )
                      ],
                    ),
                    child: const Icon(
                      Icons.fitness_center,
                      size: 45,
                      color: Color(0xFF2C5364),
                    ),
                  ),

                  const SizedBox(height: 15),

                  // TITULO
                  const Text(
                    "GymTracker",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 1,
                    ),
                  ),

                  const SizedBox(height: 5),

                  // SUBTITULO
                  const Text(
                    "Empieza tu progreso hoy",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),

                  const SizedBox(height: 35),

                  // TARJETA FORMULARIO
                  Container(
                    padding: const EdgeInsets.all(22),

                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 14,
                          offset: Offset(0, 8),
                        )
                      ],
                    ),

                    child: Form(
                      key: _formKey,

                      child: Column(
                        children: [

                          // NOMBRE
                          TextFormField(
                            controller: nombreCtrl,
                            textInputAction:
                                TextInputAction.next,

                            style: const TextStyle(
                              color: Colors.black,
                            ),

                            decoration: InputDecoration(
                              labelText: 'Nombre',

                              labelStyle:
                                  const TextStyle(
                                color: Colors.black87,
                              ),

                              prefixIcon:
                                  const Icon(
                                Icons.person,
                                color: Colors.black54,
                              ),

                              filled: true,
                              fillColor:
                                  Colors.grey.shade100,

                              border:
                                  OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                        14),
                                borderSide:
                                    BorderSide.none,
                              ),
                            ),

                            validator: (value) =>
                                value!.isEmpty
                                    ? 'Ingrese su nombre'
                                    : null,
                          ),

                          const SizedBox(height: 18),

                          // EMAIL
                          TextFormField(
                            controller: emailCtrl,
                            keyboardType:
                                TextInputType.emailAddress,
                            textInputAction:
                                TextInputAction.next,

                            style: const TextStyle(
                              color: Colors.black,
                            ),

                            decoration: InputDecoration(
                              labelText: 'Email',

                              labelStyle:
                                  const TextStyle(
                                color: Colors.black87,
                              ),

                              prefixIcon:
                                  const Icon(
                                Icons.email,
                                color: Colors.black54,
                              ),

                              filled: true,
                              fillColor:
                                  Colors.grey.shade100,

                              border:
                                  OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                        14),
                                borderSide:
                                    BorderSide.none,
                              ),
                            ),

                            validator: (value) =>
                                value!.isEmpty
                                    ? 'Ingrese su email'
                                    : null,
                          ),

                          const SizedBox(height: 18),

                          // PASSWORD
                          TextFormField(
                            controller: passCtrl,
                            obscureText: true,
                            textInputAction:
                                TextInputAction.done,

                            style: const TextStyle(
                              color: Colors.black,
                            ),

                            decoration: InputDecoration(
                              labelText: 'Password',

                              labelStyle:
                                  const TextStyle(
                                color: Colors.black87,
                              ),

                              prefixIcon:
                                  const Icon(
                                Icons.lock,
                                color: Colors.black54,
                              ),

                              filled: true,
                              fillColor:
                                  Colors.grey.shade100,

                              border:
                                  OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.circular(
                                        14),
                                borderSide:
                                    BorderSide.none,
                              ),
                            ),

                            validator: (value) =>
                                value!.length < 4
                                    ? 'Mínimo 4 caracteres'
                                    : null,
                          ),

                          const SizedBox(height: 28),

                          // BOTON
                          SizedBox(
                            width: double.infinity,
                            height: 55,

                            child: ElevatedButton(
                              onPressed: registrar,

                              style: ElevatedButton
                                  .styleFrom(
                                backgroundColor:
                                    const Color(
                                        0xFF2C5364),

                                elevation: 6,

                                shape:
                                    RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius
                                          .circular(
                                              16),
                                ),
                              ),

                              child: const Text(
                                'Registrarse',
                                style: TextStyle(
                                  fontSize: 17,
                                  fontWeight:
                                      FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}