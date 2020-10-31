
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Account.destroy_all
Transaction.destroy_all

phil = Account.create({name: "Phil", balance: 12345})
alfred = Account.create({name: "Alfred", balance: 54321})
phil.transactions.create({amount: 2000.00, kind: "withdraw", date: Time.new.strftime("%Y-%m-%d %H:%M:%S"), description: "rent"})
phil.transactions.create({amount: 200.00, kind: "withdraw", date: Time.new.strftime("%Y-%m-%d %H:%M:%S"), description: "phone bill"})
phil.transactions.create({amount: 6000.00, kind: "deposit", date: Time.new.strftime("%Y-%m-%d %H:%M:%S"), description: "pay check"})
alfred.transactions.create({amount: 3000.00, kind: "withdraw", date: Time.new.strftime("%Y-%m-%d %H:%M:%S"), description: "rent"})
alfred.transactions.create({amount: 300.00, kind: "withdraw", date: Time.new.strftime("%Y-%m-%d %H:%M:%S"), description: "phone bill"})
alfred.transactions.create({amount: 9000.00, kind: "deposit", date: Time.new.strftime("%Y-%m-%d %H:%M:%S"), description: "pay check"})
