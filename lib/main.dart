import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

enum PageType {
  registration,
  report,
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

class UserRegistrationPage extends StatefulWidget {
  @override
  _UserRegistrationPageState createState() => _UserRegistrationPageState();
}

class _UserRegistrationPageState extends State<UserRegistrationPage> {
  PageType _currentPage = PageType.registration;

  Widget _getCurrentPage() {
    switch (_currentPage) {
      case PageType.registration:
        return UserRegistrationForm();
      case PageType.report:
        return Center(child: Text("Hola Mundo"));
      default:
        return UserRegistrationForm();
    }
  }

  void _changePage(PageType page) {
    setState(() {
      _currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;  // Get screen width
    return Scaffold(
      appBar: AppBar(
        title: Text('Registro de Usuario'),
      ),
      body: Row(
        children: [
          NavigationPanel(onSelectPage: _changePage),
          Expanded(
            child: screenWidth > 600 ?
            Center(
              child: SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 600),
                  child: _getCurrentPage(),
                ),
              ),
            ) :
            _getCurrentPage(),  // Simplified layout for smaller screens
          ),
        ],
      ),
    );
  }
}

class NavigationPanel extends StatelessWidget {
  final Function(PageType) onSelectPage;

  NavigationPanel({required this.onSelectPage});

  @override
  Widget build(BuildContext context) {
    TextStyle listTileStyle = TextStyle(color: Colors.white, fontSize: 18);
    return Material(
      elevation: 4.0,
      child: Container(
        width: 250.0,  // Fixed width for the navigation panel
        color: Colors.red,
        child: ListView(
          children: <Widget>[
            ListTile(
              leading: Icon(Icons.assignment_ind, color: Colors.white),
              title: Text('Usuarios', style: listTileStyle),
              trailing: Icon(Icons.chevron_right, color: Colors.white70),
              onTap: () => onSelectPage(PageType.registration),
            ),
            ListTile(
              leading: Icon(Icons.drive_eta, color: Colors.white),
              title: Text('Conductores', style: listTileStyle),
              trailing: Icon(Icons.chevron_right, color: Colors.white70),
              onTap: () => onSelectPage(PageType.registration),
            ),
            ListTile(
              leading: Icon(Icons.directions_bus, color: Colors.white),
              title: Text('Ambulancias', style: listTileStyle),
              trailing: Icon(Icons.chevron_right, color: Colors.white70),
              onTap: () => onSelectPage(PageType.registration),
            ),
            ListTile(
              leading: Icon(Icons.report, color: Colors.white),
              title: Text('Reportes', style: listTileStyle),
              trailing: Icon(Icons.chevron_right, color: Colors.white70),
              onTap: () => onSelectPage(PageType.report),
            ),
            ListTile(
              leading: Icon(Icons.visibility, color: Colors.white),
              title: Text('Visor de Ambulancias', style: listTileStyle),
              trailing: Icon(Icons.chevron_right, color: Colors.white70),
              onTap: () => onSelectPage(PageType.registration),
            ),
            ListTile(
              leading: Icon(Icons.help_outline, color: Colors.white),
              title: Text('Soporte/Ayuda', style: listTileStyle),
              trailing: Icon(Icons.chevron_right, color: Colors.white70),
              onTap: () => onSelectPage(PageType.registration),
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
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              buildRowOfFields(),  // Primera fila de campos
              SizedBox(height: 40),  // Aumenta el espacio vertical entre filas
              buildRowOfFields2(),  // Segunda fila de campos
              SizedBox(height: 40),  // Aumenta el espacio antes del botón
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),  // Dimensiones del botón
                  textStyle: TextStyle(fontSize: 18),  // Tamaño de texto del botón
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),  // Borde redondeado del botón
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
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
Widget buildRowOfFields() {
    return Row(
      children: <Widget>[
        Expanded(
          child: customTextFormField('Nombres', 'Ingresa tus nombres'),
        ),
        SizedBox(width: 40),  // Aumenta el espacio horizontal entre campos
        Expanded(
          child: customTextFormField('Apellidos', 'Ingresa tus apellidos'),
        ),
        SizedBox(width: 40),  // Aumenta el espacio horizontal entre campos
        Expanded(
          child: customTextFormField('Número de Carnet', 'Ingresa tu número de carnet'),
        ),
      ],
    );
  }

  Widget buildRowOfFields2() {
    return Row(
      children: <Widget>[
        Expanded(
          child: customTextFormField('Fecha de Nacimiento', 'DD/MM/AAAA'),
        ),
        SizedBox(width: 40),  // Aumenta el espacio horizontal entre campos
        Expanded(
          child: customTextFormField('Dirección', 'Ingresa tu dirección'),
        ),
        SizedBox(width: 40),  // Aumenta el espacio horizontal entre campos
        Expanded(
          child: customTextFormField('Número Celular', 'Ingresa tu número celular'),
        ),
      ],
    );
  }

  Widget customTextFormField(String label, String hint) {
    return TextFormField(
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),  // Bordes redondeados para los campos de texto
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),  // Padding interno en los campos
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor ingresa $label';
        }
        return null;
      },
    );
  }