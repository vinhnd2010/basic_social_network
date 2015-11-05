User.create!(name: "Nguyen Vinh",
            email: "nguyenducvinh92@gmail.com",
            password: "123",
            password_confirmation: "123",
            admin: true)

puts "Creating users ..."
50.times do |n|
  name = Faker::Name.name
  email = "example-#{n+1}@gmail.com"
  password = "123"
  User.create!(name: name, email: email, password: password,
    password_confirmation: password)
end
