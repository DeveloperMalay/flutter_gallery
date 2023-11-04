class ProductModel {
  final String productName;
  final double price;
  final String title;
  final String details;
  final String imageUrl;

  ProductModel({
    required this.productName,
    required this.price,
    required this.title,
    required this.details,
    required this.imageUrl,
  });
}

List<ProductModel> productList = [
  ProductModel(
    productName: "Smartphone X",
    price: 599.99,
    title: "High-End Smartphone",
    details:
        "The latest model with cutting-edge features. This smartphone comes with a high-resolution OLED display, a powerful Snapdragon processor, and a top-notch camera system. Whether you're a photographer, gamer, or business professional, this smartphone has something for everyone. Stay connected and enjoy your favorite apps with blazing-fast performance. With a sleek and modern design, it's the perfect choice for tech enthusiasts.",
    imageUrl:
        "https://image.made-in-china.com/202f0j00ARKcZTslwvbO/6-7-Inch-High-End-4G-Smart-Phone-2-4G-and-5g-WiFi-V-Notch-Screen-Fingerprint-USB-Type-C-Charging-Port-Cell-Phone-Smartphone.jpg",
  ),
  ProductModel(
    productName: "Laptop Pro",
    price: 1299.99,
    title: "Powerful Laptop",
    details:
        "Great for work and gaming. The Laptop Pro is a beast when it comes to performance. Equipped with a high-performance Intel Core processor, a dedicated graphics card, and a large SSD, this laptop can handle anything you throw at it. Whether you're a professional or a gamer, this laptop delivers unmatched power and speed. Its sleek aluminum chassis and high-resolution display make it a premium choice for those who demand the best.",
    imageUrl:
        "https://www.apple.com/newsroom/images/tile-images/Apple_16-inch-MacBook-Pro_111319.jpg.og.jpg?202310101621",
  ),
  ProductModel(
    productName: "Smart Watch 3",
    price: 199.99,
    title: "Fitness Smartwatch",
    details:
        "Track your workouts, monitor your heart rate, and stay connected with the Smart Watch 3. With a durable design and long battery life, it's your perfect fitness companion. Receive notifications, control your music, and enjoy a wide range of health and fitness apps. The Smart Watch 3 is designed to keep up with your active lifestyle.",
    imageUrl: "https://m.media-amazon.com/images/I/71JU-bUt-sL.jpg",
  ),
  ProductModel(
    productName: "Wireless Headphones",
    price: 79.99,
    title: "Noise-Canceling Headphones",
    details:
        "Immerse yourself in music with these comfortable noise-canceling headphones. Enjoy crystal-clear audio, deep bass, and up to 20 hours of playtime on a single charge. The adjustable headband and cushioned ear cups ensure a perfect fit for extended listening sessions. Stay focused and block out distractions with active noise cancellation technology.",
    imageUrl:
        "https://i0.wp.com/doctormobile.lk/wp-content/uploads/2021/12/sony-wh-ch710n-wireless-noise-cancelling-headphones-blue.jpg?fit=600%2C600&ssl=1",
  ),
  ProductModel(
    productName: "Camera DSLR 2000",
    price: 899.99,
    title: "Professional Camera",
    details:
        "Capture stunning photos and videos with the Camera DSLR 2000. Its high-resolution sensor, interchangeable lenses, and advanced shooting modes make it the go-to choice for photographers. From landscapes to portraits, this camera can handle it all. Its durable build and ergonomic design ensure it's ready for any adventure.",
    imageUrl:
        "https://img2.exportersindia.com/product_images/bc-full/2022/5/3499484/canon-eos-200d-dslr-camera-1653302490-6353390.jpeg",
  ),
  ProductModel(
    productName: "Tablet Mini",
    price: 299.99,
    title: "Compact Tablet",
    details:
        "The Tablet Mini is your compact and lightweight companion for productivity and entertainment. With a vibrant display, responsive touch, and a range of apps, it's perfect for both work and play. Enjoy hours of streaming, web browsing, and app usage on a single charge. Stay connected on the go with this versatile tablet.",
    imageUrl:
        "https://andreyex.ru/wp-content/uploads/2021/12/Pochemu-iPad-Mini-6-dejstvitelno-potryasayushhij_2.jpg",
  ),
  ProductModel(
    productName: "Gaming Console Z",
    price: 399.99,
    title: "Next-Gen Gaming",
    details:
        "Step into the world of gaming like never before with the Gaming Console Z. Experience lifelike graphics, ultra-fast load times, and a vast library of games. Play solo or with friends online. The included controller offers precise control and comfort during long gaming sessions. Dive into the future of gaming with this powerful console.",
    imageUrl: "https://api.time.com/wp-content/uploads/2020/12/xbox-forza.jpg",
  ),
  ProductModel(
    productName: "Coffee Maker Deluxe",
    price: 69.99,
    title: "Coffee Lover's Dream",
    details:
        "Brew the perfect cup every time with the Coffee Maker Deluxe. Whether you prefer a strong espresso or a mild cappuccino, this coffee maker has you covered. Its programmable features, built-in grinder, and milk frother make it easy to create your favorite coffee drinks. Start your day with a delightful cup of coffee at home.",
    imageUrl: "https://m.media-amazon.com/images/I/61BDilH0UUL.jpg",
  ),
  ProductModel(
    productName: "Bluetooth Speaker",
    price: 49.99,
    title: "Portable Speaker",
    details:
        "Take your music anywhere with this compact Bluetooth speaker. It's perfect for outdoor adventures, picnics, or simply enjoying music in your backyard. The speaker is waterproof, shockproof, and designed to withstand rough conditions. With long battery life and easy connectivity, it's a great companion for those who love music on the go.",
    imageUrl:
        "https://www.artis.in/cdn/shop/products/1_f5b3377c-c870-420f-bc6a-5cd4b3a5a7c7.jpg?v=1653639993",
  ),
  ProductModel(
    productName: "4K Smart TV",
    price: 799.99,
    title: "Ultra HD Television",
    details:
        "Experience lifelike entertainment with the 4K Smart TV. It offers stunning visuals and vibrant colors with its high-resolution display. Stream your favorite shows and movies with built-in streaming apps. Connect your gaming console and enjoy immersive gameplay. With voice control and a user-friendly interface, it's a fantastic addition to your home entertainment setup.",
    imageUrl:
        "https://www.sony.co.in/image/7faee17a83fbb98c423f8888ed5b55f0?fmt=pjpeg&wid=1014&hei=396&bgcolor=F1F5F9&bgc=F1F5F9",
  ),
];
