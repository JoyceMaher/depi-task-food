import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int quantity = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.notifications, size: 28),
                  Text("عربة التسوق",
                      style:
                      TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  CircleAvatar(
                      backgroundColor: Colors.orange,
                      child:
                      Icon(Icons.arrow_forward_outlined, color: Colors.white)),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        const Text("معكرونه بالصوص و قطع بانية حار",
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        const SizedBox(height: 5),
                        const Text(
                          "هناك حقيقة مثبتة منذ زمن طويل وهي أن المحتوى المقروء لصفحة",
                          textAlign: TextAlign.right,
                          style: TextStyle(fontSize: 14),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () =>
                                          setState(() => quantity++),
                                      icon: const Icon(Icons.add,
                                          color: Colors.orange),
                                      constraints: const BoxConstraints()),
                                  Text("$quantity",
                                      style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold)),
                                  IconButton(
                                      onPressed: () => setState(() => quantity =
                                      quantity > 1 ? quantity - 1 : 1),
                                      icon: const Icon(Icons.remove,
                                          color: Colors.orange),
                                      constraints: const BoxConstraints()),
                                ],
                              ),
                            ),
                            const Text("2.20 ج.م",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16)),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 15),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      "assets/pasta.png",
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.centerRight,
                child: Text("ملخص الدفع",
                    style:
                    TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("2.00 ج.م", style: TextStyle(fontSize: 16)),
                  Text("المجموع الفرعي", style: TextStyle(fontSize: 16)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("0.30 ج.م", style: TextStyle(fontSize: 16)),
                  Text("توصيل", style: TextStyle(fontSize: 16)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("2.60 ج.م",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                  Text("المبلغ الإجمالي",
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 30),
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("2.60 ج.م",
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        Text(":الإجمالي",
                            style: TextStyle(
                                color: Colors.orange,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                      ],
                    ),
                    const SizedBox(height: 15),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        child: const Text("إتمام عملية الشراء",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
