# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


admin = User.new(email: "admin@ski-rental.com", password: "123456", first_name: "Candide", last_name: "Thovex", address: "120 rue du Mont-Blanc 74028 Chamonix")
admin.save!

renter = User.new(email: "manu@nulenski.com", password: "234567", first_name: "Emmanuel", last_name: "Bommelaer", address: "9 rue des Ecuyers 78100 SGEL")
renter.save!

product = Product.new()
product.category = "Ski"
product.name = "Mc Kinley"
product.details = "Blue pack, for beginners, year 2019, in perfect shape"
product.price_per_day = 30
product.user = admin
file = URI.open("https://backend.intersport-rent.fr/media/image/db/3d/93712707c8e5f506ec0d940dc92a.png")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

product = Product.new()
product.category = "Ski"
product.name = "Rossignol"
product.details = "Performance ski for advanced skiers, enjoy skiing on all slopes, under all conditions. Never used, as I already have a pair of skis"
product.price_per_day = 40
product.user = admin
file = URI.open("https://backend.intersport-rent.fr/media/image/54/f9/9e5f8fbae8625d7d28902208a5d2.png")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

product = Product.new()
product.category = "Ski"
product.name = "Völki"
product.details = "Ski for daily use, not suited for competition, blue, red and black, for tall people. I bought them in 2018, had a lot of fun with them but got new skis for Christmas"
product.price_per_day = 28
product.user = admin
file = URI.open("https://backend.intersport-rent.fr/media/image/9e/97/4bb122a7372b57163d09110febd4.png")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

product = Product.new()
product.category = "Snowboard"
product.name = "Salomon"
product.details = "Introducing the Salomon Pulse Snowboard, a high-performance companion for riders seeking an exhilarating mountain experience. Crafted with precision and innovation, this board seamlessly blends cutting-edge technology with a versatile design. The Pulse features a directional twin shape, providing stability and control for riders of all levels while excelling in various terrains."
product.price_per_day = 25
product.user = admin
file = URI.open("https://backend.intersport-rent.fr/media/image/f1/48/c4df024b7876bc7a4f41c69ff6ca.png")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

product = Product.new()
product.category = "Snowboard"
product.name = "Hype snowboard for women"
product.details = "the Hype Snowboard for women – a stylish and high-performance companion designed to elevate your winter adventures. This board seamlessly blends fashion with function, featuring a directional shape for stability and control on various terrains. The Hype's Hybrid Rocker profile ensures a playful yet responsive ride, perfect for riders of all levels. Crafted with a lightweight and durable wood core, this board offers a harmonious balance of flexibility and strength."
product.price_per_day = 23
product.user = admin
file = URI.open("https://backend.intersport-rent.fr/media/image/08/c2/7448a8537ab130dfaae1a2160890.png")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

product = Product.new()
product.category = "Boots"
product.name = "Aurora boots for women"
product.details = "This Aurora Boots are a perfect fusion of style and performance tailored specifically for women who crave adventure on the slopes. The Aurora Boots feature a sleek design that effortlessly complements your winter wardrobe, while their women-specific fit ensures optimal comfort and control during every ride. The quick-lacing system allows for easy and precise adjustments, so you can spend less time gearing up and more time carving through the snow."
product.price_per_day = 15
product.user = admin
file = URI.open("https://backend.intersport-rent.fr/media/image/1a/6c/c120454d9a6ea1d5f793910f7754.png")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

product = Product.new()
product.category = "Boots"
product.name = "Black and white perfect for rainy days"
product.details = "The RainDancer Boots boast a waterproof and breathable membrane, keeping your feet comfortably protected against wet conditions. The quick-lacing system allows for hassle-free adjustments, while the heat-moldable liner ensures a personalized and snug fit. Lightweight yet rugged, these boots provide the perfect balance of agility and durability. Conquer the slopes in style with the RainDancer Snowboard Boots by Hype – where fashion meets resilience for a confident ride in any weather."
product.price_per_day = 15
product.user = admin
file = URI.open("https://backend.intersport-rent.fr/media/image/1a/6c/c120454d9a6ea1d5f793910f7754.png")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!


booking = Booking.new()
booking.user = admin
booking.product = Product.first
booking.status = "Pending"
booking.start_date = DateTime.current + 1
booking.end_date = DateTime.current + 3
booking.save!

booking = Booking.new()
booking.user = admin
booking.product = Product.last
booking.status = "Pending"
booking.start_date = DateTime.current + 3
booking.end_date = DateTime.current + 10
booking.save!


booking = Booking.new()
booking.user = renter
booking.product = Product.second
booking.status = "Pending"
booking.start_date = DateTime.current + 2
booking.end_date = DateTime.current + 8
booking.save!
