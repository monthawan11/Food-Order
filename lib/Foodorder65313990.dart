import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Food Menu',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Random Food & Dessert Menu'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, String>> _menuList = [];

  final List<Map<String, String>> _foodOptions = [
    {'name': 'Pizza', 'icon': '🍕', 'type': 'Main Dish', 'price': '120 บาท', 'description': 'พิซซ่าหอมๆ ชีสเยอะๆ รสชาติเข้มข้น เหมาะสำหรับมื้ออร่อย'},
    {'name': 'Burger', 'icon': '🍔', 'type': 'Main Dish', 'price': '90 บาท', 'description': 'เบอร์เกอร์เนื้อฉ่ำ ขนมปังอ่อนนุ่ม พร้อมผักสดและซอส'},
    {'name': 'Sushi', 'icon': '🍣', 'type': 'Main Dish', 'price': '150 บาท', 'description': 'ซูชิสดใหม่ รสชาติกลมกล่อม มีทั้งปลาดิบและผัก'},
    {'name': 'Pasta', 'icon': '🍝', 'type': 'Main Dish', 'price': '110 บาท', 'description': 'พาสต้าเส้นนุ่ม ราดซอสครีมเข้มข้น รสชาติกลมกล่อม'},
    {'name': 'Ice Cream', 'icon': '🍦', 'type': 'Dessert', 'price': '50 บาท', 'description': 'ไอศกรีมหวานหอม เย็นสดชื่น มีหลากหลายรสชาติ'},
    {'name': 'Cake', 'icon': '🍰', 'type': 'Dessert', 'price': '70 บาท', 'description': 'เค้กเนื้อฟู หวานอร่อย พร้อมรสชาติครีมที่นุ่ม'},
    {'name': 'Fried Rice', 'icon': '🍛', 'type': 'Main Dish', 'price': '80 บาท', 'description': 'ข้าวผัดหอมๆ อร่อย รสชาติจัดจ้าน มีผักและเนื้อสัตว์'},
    {'name': 'Steak', 'icon': '🥩', 'type': 'Main Dish', 'price': '200 บาท', 'description': 'สเต็กเนื้อคุณภาพสูง ย่างจนได้ที่ รสชาติหอมและเนื้อฉ่ำ'},
    {'name': 'Fries', 'icon': '🍟', 'type': 'Snack', 'price': '60 บาท', 'description': 'เฟรนซ์ฟรายส์กรอบๆ ทอดจนเหลืองทอง กินเล่นก็อร่อย'},
    {'name': 'Tacos', 'icon': '🌮', 'type': 'Main Dish', 'price': '100 บาท', 'description': 'ทาโก้กรอบๆ พร้อมไส้เนื้อสัตว์หรือผัก รสชาติจัดจ้าน'},
    {'name': 'Donut', 'icon': '🍩', 'type': 'Dessert', 'price': '40 บาท', 'description': 'โดนัทนุ่มๆ พร้อมน้ำตาลเคลือบ หวานหอมอร่อย'},
    {'name': 'Croissant', 'icon': '🥐', 'type': 'Snack', 'price': '35 บาท', 'description': 'ครัวซองค์กรอบนอกนุ่มใน รสชาติหอมหวานจากเนย'},
    {'name': 'Ramen', 'icon': '🍜', 'type': 'Main Dish', 'price': '120 บาท', 'description': 'ราเม็งน้ำซุปเข้มข้น เส้นนุ่ม รสชาติกลมกล่อม'},
    {'name': 'Hotdog', 'icon': '🌭', 'type': 'Snack', 'price': '50 บาท', 'description': 'ฮอทดอกไส้กรอกอร่อย ขนมปังนุ่มพร้อมซอส'},
    {'name': 'Pancakes', 'icon': '🥞', 'type': 'Dessert', 'price': '60 บาท', 'description': 'แพนเค้กหนานุ่ม เสิร์ฟพร้อมน้ำเชื่อมหวาน'},
    {'name': 'Salad', 'icon': '🥗', 'type': 'Main Dish', 'price': '70 บาท', 'description': 'สลัดผักสดๆ อร่อยและดีต่อสุขภาพ'},
    {'name': 'Cheesecake', 'icon': '🧀', 'type': 'Dessert', 'price': '85 บาท', 'description': 'ชีสเค้กเนื้อครีมเนียนนุ่ม พร้อมแครกเกอร์กรุบกรอบด้านล่าง'},
    {'name': 'Smoothie', 'icon': '🥤', 'type': 'Drink', 'price': '55 บาท', 'description': 'สมูทตี้สดชื่น มีรสผลไม้หลายชนิด เหมาะสำหรับเครื่องดื่มคลายร้อน'},
    {'name': 'Brownie', 'icon': '🍫', 'type': 'Dessert', 'price': '75 บาท', 'description': 'บราวนี่เนื้อหนึบ รสช็อกโกแลตเข้มข้น'},
    {'name': 'Soup', 'icon': '🥣', 'type': 'Main Dish', 'price': '95 บาท', 'description': 'ซุปอุ่นๆ หอมกรุ่น รสชาติกลมกล่อมเหมาะสำหรับมื้อเย็น'},
  ];

  void _addRandomMenuItem() {
    final random = Random();
    final randomItem = _foodOptions[random.nextInt(_foodOptions.length)];
    setState(() {
      _menuList.add(randomItem);
    });
  }

  // Function to calculate the total price
  int _calculateTotalPrice() {
    int totalPrice = 0;
    for (var item in _menuList) {
      final price = int.tryParse(item['price']!.split(' ')[0]) ?? 0;
      totalPrice += price;
    }
    return totalPrice;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              'Total: ${_calculateTotalPrice()} บาท',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
      body: Center(
        child: _menuList.isEmpty
            ? const Text(
                'No items yet! Press the + button to add some food.',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              )
            : ListView.builder(
                itemCount: _menuList.length,
                itemBuilder: (context, index) {
                  final item = _menuList[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Card(
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: ListTile(
                        leading: Text(
                          item['icon']!,
                          style: const TextStyle(fontSize: 28),
                        ),
                        title: Text(
                          item['name']!,
                          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '${item['type']} - ${item['price']}',
                              style: const TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              'Description: ${item['description']}',
                              style: const TextStyle(fontSize: 14, color: Colors.black87),
                            ),
                          ],
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete, color: Colors.redAccent),
                          onPressed: () {
                            setState(() {
                              _menuList.removeAt(index);
                            });
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addRandomMenuItem,
        tooltip: 'Add Food',
        backgroundColor: Colors.orange,
        child: const Icon(Icons.add),
      ),
    );
  }
}
