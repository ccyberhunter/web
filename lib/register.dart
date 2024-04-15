import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}
enum PageType {
  registration,
  drivers,
  ambulances,
  patientReport,
  ambulanceViewer,
  support,
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro de Usuario',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: UserRegistrationPage(),
    );
  }
}

class UserRegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuario'),
      ),
      body: Row(
        children: [
          NavigationPanel(),
          Expanded(
            child: Center(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: UserRegistrationForm(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class NavigationPanel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle listTileStyle = TextStyle(color: Colors.white, fontSize: 18);
    return Material(
      elevation: 4.0,
      child: Container(
        width: 250.0,
        color: Colors.red,
        child: Column(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red[800],
              ),
              child: Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Hello Evano',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.dashboard, color: Colors.white),
                    title: Text('Dashboard', style: listTileStyle),
                    trailing: Icon(Icons.chevron_right, color: Colors.white70),
                    onTap: () {
                      // Acción para Dashboard
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.drive_eta, color: Colors.white),
                    title: Text('Conductores', style: listTileStyle),
                    trailing: Icon(Icons.chevron_right, color: Colors.white70),
                    onTap: () {
                      // Acción para Conductores
                    },
                  ),
                  ListTile(
                     leading: Icon(Icons.directions_bus, color: Colors.white),
                    title: Text('Ambulancias', style: listTileStyle),
                    trailing: Icon(Icons.chevron_right, color: Colors.white70),
                    onTap: () {
                      // Acción para la sección de Ambulancias
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.report, color: Colors.white),
                    title: Text('Reporte de Pacientes', style: listTileStyle),
                    trailing: Icon(Icons.chevron_right, color: Colors.white70),
                    onTap: () {
                      // Acción para Reportes de Pacientes
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.visibility, color: Colors.white),
                    title: Text('Visor de Ambulancias', style: listTileStyle),
                    trailing: Icon(Icons.chevron_right, color: Colors.white70),
                    onTap: () {
                      // Acción para el Visor de Ambulancias
                    },
                  ),
                  //Divider(color: Colors.white24),
                  ListTile(
                    leading: Icon(Icons.help_outline, color: Colors.white),
                    title: Text('Soporte/Ayuda', style: listTileStyle),
                    trailing: Icon(Icons.chevron_right, color: Colors.white70),
                    onTap: () {
                      // Acción para Soporte o Ayuda
                    },
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                'Versión 1.0',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}




class UserRegistrationForm extends StatefulWidget {
  @override
  _UserRegistrationFormState createState() => _UserRegistrationFormState();
}

class _UserRegistrationFormState extends State<UserRegistrationForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              // Primera fila de campos
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Nombres',
                        hintText: 'Ingresa tus nombres',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tus nombres';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10), // Espacio entre los campos
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Apellidos',
                        hintText: 'Ingresa tus apellidos',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tus apellidos';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10), // Espacio entre los campos
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Número de Carnet',
                        hintText: 'Ingresa tu número de carnet',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tu número de carnet';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20), // Espacio entre las filas
              // Segunda fila de campos
              Row(
                children: <Widget>[
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Fecha de Nacimiento',
                        hintText: 'DD/MM/AAAA',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tu fecha de nacimiento';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10), // Espacio entre los campos
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Dirección',
                        hintText: 'Ingresa tu dirección',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tu dirección';
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(width: 10), // Espacio entre los campos
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Número Celular',
                        hintText: 'Ingresa tu número celular',
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor ingresa tu número celular';
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20), // Espacio después de los campos
              ElevatedButton(
                onPressed: () {
                  // Insert form submission logic
                  if (_formKey.currentState!.validate()) {
                    // Si el formulario es válido, procesar los datos aquí
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Procesando datos...'))
                    );
                  }
                },
                child: Text('Registrar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
