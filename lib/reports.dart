import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Reportes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const ReportsPage(),
    );
  }
}

class ReportsPage extends StatelessWidget {
  const ReportsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello Evano 👋'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Implement search functionality
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: Text('Dashboard', style: TextStyle(color: Colors.white, fontSize: 25)),
            ),
            ListTile(
              leading: Icon(Icons.dashboard),
              title: Text('Dashboard'),
            ),
            ListTile(
              leading: Icon(Icons.shopping_cart),
              title: Text('Product'),
            ),
            ListTile(
              leading: Icon(Icons.people),
              title: Text('Customers'),
            ),
            // Add other ListTile widgets for the drawer menu...
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                // Navigate to reports
              },
              child: const Text('Reportes'),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: const [
                    DataColumn(label: Text('Nombres')),
                    DataColumn(label: Text('Apellidos')),
                    DataColumn(label: Text('Numero de Carnet')),
                    DataColumn(label: Text('Fecha de Nacimiento')),
                    DataColumn(label: Text('Direccion')),
                    DataColumn(label: Text('Numero de Celular')),
                    DataColumn(label: Text('Categoria Licencia')),
                    DataColumn(label: Text('Numero de Placa')),
                    DataColumn(label: Text('Editar')),
                    DataColumn(label: Text('Eliminar')),
                  ],
                  rows: List<DataRow>.generate(
                    10,
                    (index) => DataRow(
                      cells: [
                        DataCell(Text('Nombre $index')),
                        DataCell(Text('Apellido $index')),
                        DataCell(Text('Carnet $index')),
                        DataCell(Text('Fecha $index')),
                        DataCell(Text('Direccion $index')),
                        DataCell(Text('Celular $index')),
                        DataCell(Text('Categoria $index')),
                        DataCell(Text('Placa $index')),
                        DataCell(IconButton(icon: Icon(Icons.edit), onPressed: () {})),
                        DataCell(IconButton(icon: Icon(Icons.delete), onPressed: () {})),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const Text('Showing data 1 to 8 of 256 entries'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: () {}, child: Text('<')),
                TextButton(onPressed: () {}, child: Text('1')),
                TextButton(onPressed: () {}, child: Text('2')),
                TextButton(onPressed: () {}, child: Text('3')),
                TextButton(onPressed: () {}, child: Text('4')),
                TextButton(onPressed: () {}, child: Text('...')),
                TextButton(onPressed: () {}, child: Text('>')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
