import 'package:diz/screens/payment/card_data.dart';
import 'package:diz/widgets/hamburguesita/navDrawerMenuPrincipal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../cart_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: EntregaScreen(),
  ));
}

class EntregaScreen extends StatefulWidget {
  @override
  /*State<StatefulWidget> createState(){
    return CardScreenState();
  }*/
  EntregaScreenState createState() => EntregaScreenState();
}

class EntregaScreenState extends State<EntregaScreen> {
  String _street;
  String _numCasa;
  String _colonia;
  String _ciudad;
  String _cp;
  String _estado;
  String _calles;

  //final GlobalKey<_PayScreenState> _formKey = GlobalKey<_PayScreenState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Widget _buildStreet() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Calle'),
      maxLength: 50,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Dirección requerida';
        }
        return null;
      },
      onSaved: (String value) {
        _street = value;
      },
    );
  }

  Widget _buildNumC() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'No. de casa'),
      maxLength: 50,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Dirección requerida';
        }
        return null;
      },
      onSaved: (String value) {
        _numCasa = value;
      },
    );
  }

  Widget _buildColonia() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Colonia'),
      maxLength: 50,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Dirección requerida';
        }
        return null;
      },
      onSaved: (String value) {
        _colonia = value;
      },
    );
  }

  Widget _buildCiudad() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Ciudad'),
      maxLength: 50,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Dirección requerida';
        }
        return null;
      },
      onSaved: (String value) {
        _ciudad = value;
      },
    );
  }

  Widget _buildCP() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Código postal'),
      maxLength: 50,
      keyboardType: TextInputType.phone,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Dirección requerida';
        }
        return null;
      },
      onSaved: (String value) {
        _cp = value;
      },
    );
  }

  Widget _buildEstado() {
    return DropdownButtonFormField(
      decoration: InputDecoration(labelText: 'Estado'),
      value: _estado,
      onChanged: (_estadoSelected) => setState(() => _estado = _estadoSelected),
      validator: (value) => value == null ? 'Dato requerido' : null,
      items: [
        DropdownMenuItem(
          child: Text("Aguascalientes"),
          value: 1,
        ),
        DropdownMenuItem(
          child: Text("Baja California"),
          value: 2,
        ),
        DropdownMenuItem(
          child: Text("Baja California Sur"),
          value: 3,
        ),
        DropdownMenuItem(
          child: Text("Campeche"),
          value: 4,
        ),
        DropdownMenuItem(
          child: Text("Chiapas"),
          value: 5,
        ),
        DropdownMenuItem(
          child: Text("Chihuaha"),
          value: 6,
        ),
        DropdownMenuItem(
          child: Text("Ciudad de México"),
          value: 7,
        ),
      ],
      /*onChanged: (value) {
        setState(() {
          _estado = value;
        });
      },*/
    );
  }

  Widget _buildCalles() {
    return TextFormField(
      decoration: InputDecoration(labelText: 'Calles contiguas'),
      maxLength: 50,
      validator: (String value) {
        if (value.isEmpty) {
          return 'Dirección requerida';
        }
        return null;
      },
      onSaved: (String value) {
        _calles = value;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: NavDrawer(),
        appBar: AppBar(
            backgroundColor: Colors.black87,
            elevation: 0,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: () =>
                    Navigator.of(context).pushNamed(CartScreen.routeName),
              ),
            ]),
        body: new ListView(
          children: <Widget>[
            new Padding(
                padding: const EdgeInsets.all(15.0),
                child: new Text('Dirección de entrega',
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 20))),
            Container(),
            Container(
              margin: EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    _buildCP(),
                    _buildStreet(),
                    _buildNumC(),
                    _buildCalles(),
                    _buildColonia(),
                    _buildCiudad(),
                    _buildEstado(),
                    SizedBox(height: 100),
                    RaisedButton(
                      child: Text(
                        'Siguiente',
                        style: TextStyle(color: Colors.black, fontSize: 16),
                      ),
                      onPressed: () {
                        if (!_formKey.currentState.validate()) {
                          return;
                        } else {
                          _formKey.currentState.save();
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return CardScreen();
                              },
                            ),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),
            )
          ],
        ));
  }
}