import 'package:flutter/material.dart';
import 'cart_page.dart';
import 'details_screen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 4;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const Placeholder(), // Profile
    const CartPage(),    // Cart
    const Placeholder(), // Floating cart
    const Placeholder(), // Favorites
    const HomePageContent(), // Home content
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 8,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                  onPressed: () => _onItemTapped(0),
                  icon: Icon(Icons.person_outline,
                      color: _selectedIndex == 0 ? Colors.red : Colors.black)),
              IconButton(
                  onPressed: () => _onItemTapped(1),
                  icon: Icon(Icons.shopping_cart_outlined,
                      color: _selectedIndex == 1 ? Colors.red : Colors.black)),
              const SizedBox(width: 40),
              IconButton(
                  onPressed: () => _onItemTapped(3),
                  icon: Icon(Icons.favorite_border,
                      color: _selectedIndex == 3 ? Colors.red : Colors.black)),
              IconButton(
                  onPressed: () => _onItemTapped(4),
                  icon: Icon(Icons.home_outlined,
                      color: _selectedIndex == 4 ? Colors.red : Colors.black)),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _onItemTapped(2),
        backgroundColor: Colors.orange,
        child: const Icon(Icons.shopping_cart),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Icon(Icons.notifications_none, size: 28),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Text("الموقع الحالي",
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                      SizedBox(height: 2),
                      Text("19 الشيخ احمد الصاوي ، مدينة نصر",
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  ),
                  CircleAvatar(
                    radius: 21,
                    backgroundImage: const AssetImage("assets/avatar.png"), // moved to end
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.orange, width: 2),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search, color: Colors.orange, size: 24),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        textDirection: TextDirection.rtl,
                        decoration: InputDecoration(
                          hintText: "تبحث عن وجبة معينة ؟",
                          hintStyle:
                          TextStyle(fontSize: 16, color: Colors.grey),
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(vertical: 16),
                        ),
                        style:
                        TextStyle(fontSize: 16, color: Colors.black87),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  FoodCategory(title: "لحوم", imagePath: "assets/meat.png"),
                  FoodCategory(title: "ماكولات بحرية", imagePath: "assets/seafood.png"),
                  FoodCategory(title: "مشويات", imagePath: "assets/chicken.png"),
                  FoodCategory(title: "وجبات سريعة", imagePath: "assets/burger.png"),
                ],
              ),
              const SizedBox(height: 30),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  "assets/main_pic.png",
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Text("🔥", style: TextStyle(fontSize: 22)),
                  SizedBox(width: 8),
                  Text("الافضل خلال اليوم",
                      style:
                      TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/details');
                      },
                      child: FoodItemCard(
                        title: "بج ببرجر سباسي",
                        category: "وجبات سريعة",
                        rating: "5.0",
                        reviewCount: "+100",
                        price: "150",
                        cardImagePath: "assets/seafood_card.png",
                        isAddToCartRed: true,
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/details');
                      },
                      child: FoodItemCard(
                        title: "بج ببرجر سباسي",
                        category: "وجبات سريعة",
                        rating: "5.0",
                        reviewCount: "+100",
                        price: "150",
                        cardImagePath: "assets/burger_card.png",
                        isAddToCartRed: true,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FoodCategory extends StatelessWidget {
  final String title;
  final String imagePath;

  const FoodCategory({super.key, required this.title, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.grey[100],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(imagePath, width: 70, height: 70, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 8),
        Text(title,
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
            maxLines: 2),
      ],
    );
  }
}

class FoodItemCard extends StatelessWidget {
  final String title;
  final String category;
  final String rating;
  final String reviewCount;
  final String price;
  final String cardImagePath;
  final bool isAddToCartRed;

  const FoodItemCard({
    super.key,
    required this.title,
    required this.category,
    required this.rating,
    required this.reviewCount,
    required this.price,
    required this.cardImagePath,
    this.isAddToCartRed = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(cardImagePath, width: double.infinity, height: 120, fit: BoxFit.cover),
          ),
          const SizedBox(height: 12),
          Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(category, style: const TextStyle(fontSize: 14, color: Colors.grey)),
              const SizedBox(height: 4),
              Text("($reviewCount) $rating ★",
                  style: const TextStyle(fontSize: 14, color: Colors.orange, fontWeight: FontWeight.w500)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text("$price ج.م",
                  style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black87)),
              const Spacer(),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.shopping_cart_outlined, color: Colors.white, size: 18),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
