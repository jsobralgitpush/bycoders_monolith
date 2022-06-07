# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

file = File.open("#{Rails.root.join('public')}/cnab.txt")

file_data = file.readlines.map(&:chomp)

file_data.each do |line|
    transaction = Transaction.new

    transaction.transaction_type = line[0]
    transaction.date =  line[1, 8]
    if [1,4,5,6,7,8].include? line[0].to_i 
        transaction.amount = line[9, 10]
    else
        transaction.amount = -(line[9, 10].to_f)
    end
    transaction.taxpayer_id = line[19, 11]
    transaction.card_used =  line[30, 12]
    transaction.time =  line[42, 6]
    transaction.store_owner =  line[48, 14]
    transaction.store_name = line[62, 19]

    transaction.save
end