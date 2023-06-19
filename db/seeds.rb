# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

orders = JSON.parse(File.read(Rails.root.join('db/data/orders.json')))

orders.each do |order|
  new_order = Order.create(order.transform_keys(&:underscore).except('items'))

  order['items'].each do |item|
    Item.create(item.merge(order_id: new_order.id))
  end
end
