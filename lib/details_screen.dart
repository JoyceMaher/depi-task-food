import 'package:flutter/material.dart';
import 'home_page.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int quantity = 1;
  String selectedOption = "سنجل";
  Map<String, bool> multiOptions = {"سلطه": false, "حار": false, "عادي": false};

  final double basePrice = 2.20;
  final Map<String, double> section1Prices = {"سنجل": 1.0, "دبل": 1.5};
  final Map<String, double> section2Prices = {"سلطه": 0.5, "حار": 0.8, "عادي": 1.2};

  double get totalPrice {
    double price1 = section1Prices[selectedOption] ?? 0.0;
    double price2 = multiOptions.entries
        .where((e) => e.value)
        .fold(0.0, (sum, e) => sum + (section2Prices[e.key] ?? 0.0));
    return quantity * (basePrice + price1 + price2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Directionality(
        textDirection: TextDirection.rtl,
        child: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 120),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 250,
                          width: double.infinity,
                          child: Image.asset(
                            "assets/pasta.png",
                            fit: BoxFit.cover, // photo fills entire area
                          ),
                        ),
                        Positioned(
                          left: 16,
                          top: 16,
                          child: IconButton(
                            icon: const Icon(Icons.notifications, color: Colors.white),
                            onPressed: () {},
                          ),
                        ),
                        Positioned(
                          right: 16,
                          top: 16,
                          child: IconButton(
                            icon: const Icon(Icons.arrow_back, color: Colors.white),
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (_) => const HomePage()),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            "معكرونه بالصوص و قطع بانية حار",
                            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 8),
                          Text(
                            "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة ما سيلهي القارئ عن التركيز على الشكل الخارجي للنص أو شكل توضع الفقرات في الصفحة التي يقرأها.",
                            style: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey.shade300),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove, color: Colors.orange),
                                  onPressed: () {
                                    setState(() {
                                      if (quantity > 1) quantity--;
                                    });
                                  },
                                  constraints: const BoxConstraints(),
                                ),
                                Text(
                                  "$quantity",
                                  style: const TextStyle(
                                      fontSize: 16, fontWeight: FontWeight.bold),
                                ),
                                IconButton(
                                  icon: const Icon(Icons.add, color: Colors.orange),
                                  onPressed: () {
                                    setState(() {
                                      quantity++;
                                    });
                                  },
                                  constraints: const BoxConstraints(),
                                ),
                              ],
                            ),
                          ),
                          Text(
                            "${totalPrice.toStringAsFixed(2)} د.ك",
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          const Text(
                            "الحجم",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                            child: const Text(
                              " الزامي",
                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: section1Prices.keys.map((key) {
                          bool isSelected = selectedOption == key;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedOption = key;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: isSelected ? Colors.orange : Colors.grey),
                                        ),
                                        child: isSelected
                                            ? const Icon(Icons.check, size: 14, color: Colors.orange)
                                            : null,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        key,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "${section1Prices[key]?.toStringAsFixed(2)} د.ك",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Row(
                        children: [
                          const Text(
                            "الإضافات",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Container(
                            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                            child: const Text(
                              "اختياري",
                              style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: multiOptions.keys.map((key) {
                          bool isSelected = multiOptions[key]!;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                multiOptions[key] = !multiOptions[key]!;
                              });
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(vertical: 6),
                              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        width: 20,
                                        height: 20,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: isSelected ? Colors.orange : Colors.grey),
                                        ),
                                        child: isSelected
                                            ? const Icon(Icons.check, size: 14, color: Colors.orange)
                                            : null,
                                      ),
                                      const SizedBox(width: 8),
                                      Text(
                                        key,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold, color: Colors.black),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    "${section2Prices[key]?.toStringAsFixed(2)} د.ك",
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold, color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    const SizedBox(height: 100),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  color: Colors.white,
                  child: SafeArea(
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${totalPrice.toStringAsFixed(2)} د.ك",
                            style: const TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          const Text(
                            "إضافة إلى السلة",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          Row(
                            children: [
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    if (quantity > 1) quantity--;
                                  });
                                },
                                icon: const Icon(Icons.remove, color: Colors.white),
                                constraints: const BoxConstraints(),
                              ),
                              Text(
                                "$quantity",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              IconButton(
                                onPressed: () {
                                  setState(() {
                                    quantity++;
                                  });
                                },
                                icon: const Icon(Icons.add, color: Colors.white),
                                constraints: const BoxConstraints(),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
