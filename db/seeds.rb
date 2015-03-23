AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')

# generate products
100.times do |n|

  item_code  = Faker::Code.ean
  item_name = Faker::Commerce.product_name
  central_name = Faker::Address.street_name
  origin = Faker::Address.city
  class_type = Faker::Commerce.department
  unit_cost = Faker::Commerce.price
  lien_name = Faker::Commerce.product_name
  lien_cost = Faker::Commerce.price
  lien_name2 = Faker::Commerce.product_name
  lien_cost2 = Faker::Commerce.price

  Product.create!(
  	item_code: item_code,
    item_name: item_name,
    central_name: central_name,
    item_type: "Raw",
    origin: origin,
    class_type: class_type,
    unit_cost: unit_cost,
    liens_attributes: [{name: lien_name, cost: lien_cost}, {name: lien_name2, cost: lien_cost2}])

end

# generate customers
100.times do |n|

  customer_code  = Faker::Code.ean
  customer_name = Faker::Name.name
  address = Faker::Address.street_address + Faker::Address.city
  contact_numbers = Faker::PhoneNumber.phone_number
  tin_number = Faker::Company.duns_number

  Customer.create!(
  	customer_code: customer_code,
    customer_name: customer_name,
    address: address,
    contact_numbers: contact_numbers,
    tin_number: tin_number)

end

# generate suppliers
100.times do |n|

  supplier_code  = Faker::Code.ean
  supplier_name = Faker::Company.name
  supplier_type = "Supplier"

  Supplier.create!(
  	supplier_code: supplier_code,
    supplier_name: supplier_name,
    supplier_type: supplier_type)

end

# generate salesman
100.times do |n|

  salesman_code  = Faker::Code.ean
  salesman_name = Faker::Name.name

  Salesman.create!(
  	salesman_code: salesman_code,
    salesman_name: salesman_name)

end