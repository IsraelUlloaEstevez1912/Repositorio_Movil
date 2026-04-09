import 'package:flutter/material.dart';
import 'peso_screen.dart';

class SeguimientoScreen extends StatefulWidget {
  final List<Map<String, String>> ejercicios;

  const SeguimientoScreen({super.key, required this.ejercicios});

  @override
  State<SeguimientoScreen> createState() =>
      _SeguimientoScreenState();
}

class _SeguimientoScreenState
    extends State<SeguimientoScreen> {

  List<bool> completados = [];
  final notasCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    completados = List.generate(
        widget.ejercicios.length, (_) => false);
  }

  @override
  void dispose() {
    notasCtrl.dispose();
    super.dispose();
  }

  void irPeso() {
    FocusScope.of(context).unfocus();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => const PesoScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

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
          child: Padding(
            padding: const EdgeInsets.all(20),

            child: Column(
              children: [

                const SizedBox(height: 5),

                // TITULO
                const Text(
                  "Seguimiento",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 5),

                const Text(
                  "Marca tus ejercicios completados",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                  ),
                ),

                const SizedBox(height: 20),

                // LISTA EJERCICIOS
                Expanded(
                  child: widget.ejercicios.isEmpty
                      ? const Center(
                          child: Text(
                            "No hay ejercicios",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount:
                              widget.ejercicios.length,

                          itemBuilder: (_, i) {

                            final e =
                                widget.ejercicios[i];

                            return Container(
                              margin:
                                  const EdgeInsets
                                      .symmetric(
                                vertical: 8,
                              ),

                              padding:
                                  const EdgeInsets
                                      .all(14),

                              decoration:
                                  BoxDecoration(
                                color: Colors.white,

                                borderRadius:
                                    BorderRadius
                                        .circular(18),

                                boxShadow: const [
                                  BoxShadow(
                                    color:
                                        Colors.black12,
                                    blurRadius: 10,
                                    offset:
                                        Offset(0, 6),
                                  )
                                ],
                              ),

                              child: Row(
                                children: [

                                  // ICONO ESTADO
                                  Icon(
                                    completados[i]
                                        ? Icons.check_circle
                                        : Icons
                                            .radio_button_unchecked,

                                    color: completados[i]
                                        ? Colors.green
                                        : Colors.grey,

                                    size: 30,
                                  ),

                                  const SizedBox(
                                      width: 12),

                                  // INFO EJERCICIO
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,

                                      children: [

                                        Text(
                                          e["nombre"] ??
                                              '',

                                          style:
                                              const TextStyle(
                                            fontWeight:
                                                FontWeight
                                                    .bold,

                                            fontSize: 16,
                                          ),
                                        ),

                                        const SizedBox(
                                            height: 3),

                                        Text(
                                          "${e["sets"] ?? ''} sets - ${e["reps"] ?? ''} reps",

                                          style:
                                              const TextStyle(
                                            color:
                                                Colors.black54,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),

                                  // CHECKBOX
                                  Checkbox(
                                    value:
                                        completados[i],

                                    activeColor:
                                        const Color(
                                            0xFF2C5364),

                                    onChanged: (val) {
                                      setState(() {
                                        completados[i] =
                                            val!;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ),

                const SizedBox(height: 15),

                // TARJETA NOTAS
                Container(
                  padding:
                      const EdgeInsets.all(16),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(22),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 14,
                        offset: Offset(0, 8),
                      )
                    ],
                  ),

                  child: TextField(
                    controller: notasCtrl,
                    maxLines: 3,

                    decoration: InputDecoration(
                      labelText: 'Notas',

                      labelStyle:
                          const TextStyle(
                        color: Colors.black87,
                      ),

                      alignLabelWithHint: true,

                      prefixIcon:
                          const Icon(
                        Icons.note,
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
                  ),
                ),

                const SizedBox(height: 18),

                // BOTON CONTINUAR
                SizedBox(
                  width: double.infinity,
                  height: 55,

                  child: ElevatedButton(
                    onPressed: irPeso,

                    style:
                        ElevatedButton.styleFrom(
                      backgroundColor:
                          const Color(0xFF2C5364),

                      foregroundColor:
                          Colors.white,

                      elevation: 6,

                      shape:
                          RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                                16),
                      ),
                    ),

                    child: const Text(
                      'Guardar y continuar',
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
      ),
    );
  }
}