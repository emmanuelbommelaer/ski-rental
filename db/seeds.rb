# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


admin = User.new(email: "admin@ski-rental.com", password: "123456", first_name: "Candide", last_name: "Thovex", address: "120 rue du Mont-Blanc 74028 Chamonix")
admin.save!

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

booking = Booking.new()
booking.user = admin
booking.product = Product.first
booking.status = "Pending"
booking.start_date = DateTime.current + 1
booking.end_date = DateTime.current + 3
booking.save!


booking = Booking.new()
booking.user = admin
booking.product = Product.second
booking.status = "Pending"
booking.start_date = DateTime.current + 2
booking.end_date = DateTime.current + 8
booking.save!
