import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WhatsApp',
      theme: ThemeData(
        primaryColor: Color(0xFF075E54),
        accentColor: Color(0xFF128C7E),
      ),
      home: WhatsAppHomePage(),
    );
  }
}

class WhatsAppHomePage extends StatefulWidget {
  @override
  _WhatsAppHomePageState createState() => _WhatsAppHomePageState();
}

class _WhatsAppHomePageState extends State<WhatsAppHomePage> {
  int _selectedIndex = 0;
  final List<String> _chats = [
    'vendedor 1',
    'vendedor 2',
    'vendedor 3',
    'vendedor 4',
    'vendedor 5',
    'vendedor 6',
    'vendedor 7',
    'vendedor 8',
    'vendedor 9',
    'vendedor 10',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('WhatsApp'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Acción de búsqueda
            },
          ),
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              // Acción de menú
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage('https://picsum.photos/200'),
                    radius: 30,
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Tu Nombre',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    '+1 234 567 890',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('Nuevos grupos'),
            ),
            ListTile(
              leading: Icon(Icons.shop),
              title: Text('Compras'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => GalleryPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.inbox),
              title: Text('Informacion'),
            ),
            ListTile(
              leading: Icon(Icons.bookmark_border),
              title: Text('Elementos destacados'),
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Ajustes'),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text('Desarrollador'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DesarrolladorPage()),
                );
              },
            ),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: _chats.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage('https://picsum.photos/200'),
            ),
            title: Text(_chats[index]),
            subtitle: Text('Último mensaje'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '8:29',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Container(
                  width: 20,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '2',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).accentColor,
        child: Icon(
          Icons.message,
          color: Colors.white,
        ),
        onPressed: () {
          // Acción de nuevo chat
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.camera_alt),
            label: 'Cámara',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.call),
            label: 'Llamadas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Ajustes',
          ),
        ],
      ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}

class DesarrolladorPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Desarrollador'),
      ),
      body: ListView(
        children: [
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage('https://picsum.photos/200'),
                radius: 60,
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('Información'),
            subtitle: Text('desarrollador junior'),
            onTap: () {
              // Acción para mostrar información del desarrollador
            },
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Contacto'),
            subtitle: Text('juanestebanperezmendiola@gmail.com'),
            onTap: () {
              // Acción para contactar con el desarrollador
            },
          ),
          ListTile(
            leading: Icon(Icons.star),
            title: Text('Calificar'),
            subtitle: Text('califica este servicio: ✩✩✩✩✩'),
            onTap: () {
              // Acción para calificar la aplicación
            },
          ),
          ListTile(
            leading: Icon(Icons.share),
            title: Text('Compartir'),
            subtitle: Text('Comparte esta aplicación'),
            onTap: () {
              // Acción para compartir la aplicación
            },
          ),
        ],
      ),
    );
  }
}

class GalleryPage extends StatelessWidget {
  final List<Map<String, dynamic>> photos = [
    {
      'title': 'Productos #1',
      'description': 'Majestuosas montañas cubiertas de nieve',
      'imageUrl':
          'https://www.ionos.es/digitalguide/fileadmin/DigitalGuide/Teaser/exif-t.jpg',
    },
    {
      'title': 'Productos #2',
      'description': 'Hermosa puesta de sol en una playa tropical',
      'imageUrl':
          'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1173&q=80',
    },
    {
      'title': 'Productos #3',
      'description': 'Impresionante cascada rodeada de vegetación',
      'imageUrl':
          'https://png.pngtree.com/png-clipart/20200317/ourmid/pngtree-hand-drawn-mobile-voice-customer-service-cartoon-illustration-png-image_2162269.jpg',
    },
    {
      'title': 'Productos #4',
      'description': 'Tranquilo lago rodeado de imponentes montañas',
      'imageUrl':
          'https://images.unsplash.com/photo-1506744038136-46273834b3fb?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80',
    },
    // Agrega más fotos aquí
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Galería de Paisajes'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300, // Ancho máximo de cada elemento
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
          ),
          itemCount: photos.length,
          itemBuilder: (context, index) {
            final photo = photos[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PhotoDetailsPage(photo: photo),
                  ),
                );
              },
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16.0),
                        child: Image.network(
                          photo['imageUrl'],
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            photo['title'],
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16.0,
                            ),
                          ),
                          SizedBox(height: 4.0),
                          Text(
                            photo['description'],
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class PhotoDetailsPage extends StatelessWidget {
  final Map<String, dynamic> photo;

  const PhotoDetailsPage({Key? key, required this.photo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(photo['title']),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Image.network(
              photo['imageUrl'],
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              photo['description'],
              style: TextStyle(fontSize: 16.0),
            ),
          ),
        ],
      ),
    );
  }
}
