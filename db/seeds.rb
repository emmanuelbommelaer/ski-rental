# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


admin = User.new(email: "admin@ski-rental.com",
                  password: "123456",
                  first_name: "Candide",
                  last_name: "Thovex",
                  address: "16 villa Gaudelet, 75011 Paris")
admin.save!

manu = User.new(email: "manu@nulenski.com",
                  password: "234567",
                  first_name: "Emmanuel",
                  last_name: "Bommelaer",
                  address: "123 Rte de la Roumnaz, 74400 Chamonix")
manu.save!

john = User.new(email: "john@nulenski.com",
                  password: "234567",
                  first_name: "John",
                  last_name: "Doe",
                  address: "10 Rue Georges Clemenceau, 44000 Nantes")
john.save!

emily = User.new(email: "emily@nulenski.com",
                  password: "234567",
                  first_name: "Emily",
                  last_name: "Friendly",
                  address: "149 Rue Garibaldi, 69003 Lyon")
emily.save!

lila = User.new(email: "lila@nulenski.com",
                  password: "234567",
                  first_name: "Lila",
                  last_name: "Gostrong",
                  address: "4 Rue Paul Claudel, 38100 Grenoble")
lila.save!

puts 'Users created'

puts 'creating sample skis'

product = Product.new()
product.category = "Ski"
product.name = "McKinley ACTIVE"
product.details = "Blue pack, for beginners, year 2019, in perfect shape, Gear up for an unforgettable skiing escapade with our top-notch ski rental service. Our premium ski packages include high-performance skis, meticulously tuned for various terrains. From smooth groomed trails to challenging powder, our expertly maintained skis ensure an exhilarating and seamless glide down the slopes."
product.price_per_day = 30
product.user = admin
file = URI.open("https://backend.intersport-rent.fr/media/image/db/3d/93712707c8e5f506ec0d940dc92a.png")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

product = Product.new()
product.category = "Ski"
product.name = "Rossignol FORZA"
product.details = "Performance ski for advanced skiers, enjoy skiing on all slopes, under all conditions. Never used, as I already have a pair of skis, a stylish and high-performance companion designed to elevate your winter adventures. This board seamlessly blends fashion with function, featuring a directional shape for stability and control on various terrains. The Hype's Hybrid Rocker profile ensures a playful yet responsive ride, perfect for riders of all levels. Crafted with a lightweight and durable wood core"
product.price_per_day = 40
product.user = manu
file = URI.open("https://backend.intersport-rent.fr/media/image/54/f9/9e5f8fbae8625d7d28902208a5d2.png")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

product = Product.new()
product.category = "Ski"
product.name = "Völki KENDO"
product.details = "Ski for daily use, not suited for competition, blue, red and black, for tall people. I bought them in 2018, had a lot of fun with them but got new skis for Christmas"
product.price_per_day = 28
product.user = john
file = URI.open("https://backend.intersport-rent.fr/media/image/9e/97/4bb122a7372b57163d09110febd4.png")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

product = Product.new()
product.category = "Ski"
product.name = "KORE X80"
product.details = "https://media.intersport.fr/is/image/intersportfr/315162_558_FA?$produit_m$"
product.price_per_day = 22
product.user = john
file = URI.open("https://backend.intersport-rent.fr/media/image/9e/97/4bb122a7372b57163d09110febd4.png")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

product = Product.new()
product.category = "Ski"
product.name = "Salomon MAX"
product.details = "https://media.intersport.fr/is/image/intersportfr/315162_558_FA?$produit_m$"
product.price_per_day = 21
product.user = john
file = URI.open("https://media.intersport.fr/is/image/intersportfr/L47104707Z_FA?$produit_m$")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

puts 'creating sample snowboards'

product = Product.new()
product.category = "Snowboard"
product.name = "Salomon PULSE"
product.details = "Introducing the Salomon Pulse Snowboard, a high-performance companion for riders seeking an exhilarating mountain experience. Crafted with precision and innovation, this board seamlessly blends cutting-edge technology with a versatile design. The Pulse features a directional twin shape, providing stability and control for riders of all levels while excelling in various terrains, feature a sleek design that effortlessly complements your winter wardrobe, while their women-specific fit ensures optimal comfort and control during every ride. The quick-lacing system allows for easy and precise adjustments, so you can spend less time gearing up and more time carving through the snow"
product.price_per_day = 25
product.user = emily
file = URI.open("https://backend.intersport-rent.fr/media/image/f1/48/c4df024b7876bc7a4f41c69ff6ca.png")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

product = Product.new()
product.category = "Snowboard"
product.name = "Salomon HYPE"
product.details = "the Hype Snowboard for women – a stylish and high-performance companion designed to elevate your winter adventures. This board seamlessly blends fashion with function, featuring a directional shape for stability and control on various terrains. The Hype's Hybrid Rocker profile ensures a playful yet responsive ride, perfect for riders of all levels. Crafted with a lightweight and durable wood core, this board offers a harmonious balance of flexibility and strength."
product.price_per_day = 23
product.user = admin
file = URI.open("https://backend.intersport-rent.fr/media/image/08/c2/7448a8537ab130dfaae1a2160890.png")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

product = Product.new()
product.category = "Snowboard"
product.name = "Firefly FANCY"
product.details = "Let the FIREFLY Fancy be your opinion on the slopes. With an eye-catching and stylish print, you're sure to turn heads. The FIREFLY Fancy is the perfect combination for all-terrain and all-mountain freestyle with underfoot camber and reverse camber at the tip and tail. The Fancy offers excellent edge control thanks to the soft polyurethane sidewall and effortless floating in powder. If you're looking for a good ride and good value, make your mark on the slopes with the FIREFLY Fancy."
product.price_per_day = 17
product.user = lila
file = URI.open("https://media.intersport.fr/is/image/intersportfr/270384_2I2_FA?$produit_m$")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

product = Product.new()
product.category = "Snowboard"
product.name = "K2 GEOMETRIC"
product.details = "The K2 Geometric has been designed with a jib-friendly shape, flex and camber profile for intermediate and beginner snowboarders."
product.price_per_day = 17
product.user = emily
file = URI.open("https://media.intersport.fr/is/image/intersportfr/00091149NA_FA?$produit_m$")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

product = Product.new()
product.category = "Snowboard"
product.name = "McKinley Furious"
product.details = "The Furious II freeride snowboard is designed for intermediate riders and features an all-wood sidewall."
product.price_per_day = 15
product.user = lila
file = URI.open("https://media.intersport.fr/is/image/intersportfr/421546_YKK_FA?$produit_m$")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

puts 'creating sample boots'

product = Product.new()
product.category = "Boots"
product.name = "Rossignol TRACKS"
product.details = "https://media.intersport.fr/is/image/intersportfr/RBM3520ENS_PR?$produit_m$"
product.price_per_day = 15
product.user = lila
file = URI.open("https://backend.intersport-rent.fr/media/image/1a/6c/c120454d9a6ea1d5f793910f7754.png")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

product = Product.new()
product.category = "Boots"
product.name = "Raindancer BASIC"
product.details = "The RainDancer Boots boast a waterproof and breathable membrane, keeping your feet comfortably protected against wet conditions. The quick-lacing system allows for hassle-free adjustments, while the heat-moldable liner ensures a personalized and snug fit. Lightweight yet rugged, these boots provide the perfect balance of agility and durability. Conquer the slopes in style with the RainDancer Snowboard Boots by Hype – where fashion meets resilience for a confident ride in any weather."
product.price_per_day = 15
product.user = lila
file = URI.open("https://backend.intersport-rent.fr/media/image/1a/6c/c120454d9a6ea1d5f793910f7754.png")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

product = Product.new()
product.category = "Boots"
product.name = "Tecnica MACH"
product.details = "The perfect balance of comfort and performance for all-day skiing!"
product.price_per_day = 16
product.user = lila
file = URI.open("https://media.intersport.fr/is/image/intersportfr/1947G6_2DF_PR?$produit_m$")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

product = Product.new()
product.category = "Boots"
product.name = "Atomic HAWX"
product.details = "the Hawx is a blend of fit and balance that works in all conditions. The Hawx MAGNA is the most comfortable of the family. It is suitable for intermediate to good skiers with wide feet. Its 85 flex and softer instep material guarantee excellent precision, comfort and ease of use. COMFORT, EASE OF FITTING, PERFORMANCE"
product.price_per_day = 13
product.user = lila
file = URI.open("https://backend.intersport-rent.fr/media/image/1a/6c/c120454d9a6ea1d5f793910f7754.png")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

puts 'creating sample helmets'

product = Product.new()
product.category = "Helmet"
product.name = "2023 Helmet"
product.details = "Embark on your alpine adventure fully protected with our premium ski helmet rental service. Crafted for comfort and safety, our helmets are designed to provide optimal head protection while navigating the slopes. Adjustable straps ensure a secure fit, while ventilation systems keep you cool during intense runs. Whether you're a seasoned skier or hitting the slopes for the first time, our high-quality helmets guarantee a worry-free and exhilarating skiing experience."
product.price_per_day = 8
product.user = john
file = URI.open("https://backend.intersport-rent.fr/media/image/b3/72/a63b1cfd153884a11b8b51f2a4f9.png")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

product = Product.new()
product.category = "Helmet"
product.name = "McKinley Pulse"
product.details = "Embark on your alpine adventure fully protected with our premium ski helmet rental service. Crafted for comfort and safety, our helmets are designed to provide optimal head protection while navigating the slopes. Adjustable straps ensure a secure fit, while ventilation systems keep you cool during intense runs. Whether you're a seasoned skier or hitting the slopes for the first time, our high-quality helmets guarantee a worry-free and exhilarating skiing experience."
product.price_per_day = 12
product.user = manu
file = URI.open("https://media.intersport.fr/is/image/intersportfr/409326_HTG_PR?$produit_m$")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

product = Product.new()
product.category = "Helmet"
product.name = "Salomon Pioneer"
product.details = "Embark on your alpine adventure fully protected with our premium ski helmet rental service. Crafted for comfort and safety, our helmets are designed to provide optimal head protection while navigating the slopes. Adjustable straps ensure a secure fit, while ventilation systems keep you cool during intense runs. Whether you're a seasoned skier or hitting the slopes for the first time, our high-quality helmets guarantee a worry-free and exhilarating skiing experience."
product.price_per_day = 23
product.user = manu
file = URI.open("https://media.intersport.fr/is/image/intersportfr/L412614ENP_FA?$produit_m$")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

product = Product.new()
product.category = "Helmet"
product.name = "Salomon VISOR"
product.details = "Embark on your alpine adventure fully protected with our premium ski helmet rental service. Crafted for comfort and safety, our helmets are designed to provide optimal head protection while navigating the slopes. Adjustable straps ensure a secure fit, while ventilation systems keep you cool during intense runs. Whether you're a seasoned skier or hitting the slopes for the first time, our high-quality helmets guarantee a worry-free and exhilarating skiing experience."
product.price_per_day = 31
product.user = manu
file = URI.open("https://media.intersport.fr/is/image/intersportfr/L471634AKU_PR?$produit_m$")
product.photo.attach(io: file, filename: "#{product.name}.png", content_type: "image/png")
product.save!

puts 'Products created, updating index'

Product.clear_index!
Product.reindex!

puts 'index updated, creating sample bookings'

booking = Booking.new()
booking.user = admin
booking.product = Product.find_by_name("Raindancer BASIC")
booking.status = "Pending"
booking.start_date = DateTime.current + 31
booking.end_date = DateTime.current + 33
booking.message = "I hope this message finds you well. I'm writing to confirm my booking for ski rental through your marketplace."
booking.save!

booking = Booking.new()
booking.user = admin
booking.product = Product.find_by_name("Tecnica MACH")
booking.status = "Pending"
booking.start_date = DateTime.current + 33
booking.end_date = DateTime.current + 40
booking.message = "I hope this message finds you well. I'm writing to confirm my booking for ski rental through your marketplace."
booking.save!

booking = Booking.new()
booking.user = emily
booking.product = Product.find_by_name("Firefly FANCY")
booking.status = "Pending"
booking.start_date = DateTime.current + 32
booking.end_date = DateTime.current + 38
booking.message = "I hope this message finds you well. I'm writing to confirm my booking for ski rental through your marketplace."
booking.save!

booking = Booking.new()
booking.user = john
booking.product = Product.find_by_name("McKinley ACTIVE")
booking.status = "Pending"
booking.start_date = DateTime.current + 32
booking.end_date = DateTime.current + 38
booking.message = "I hope this message finds you well. I'm writing to confirm my booking for ski rental through your marketplace."
booking.save!
