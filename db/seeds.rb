# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
case Rails.env
when "development"
  AdminUser.create!(email: 'pierre@michaux.com', password: 'progenitor', password_confirmation: 'progenitor')
  User.create!(email: 'pierre@michaux.com', password: 'progenitor', password_confirmation: 'progenitor')
  User.create!(email: 'u@u.com', password: 'secret', password_confirmation: 'secret')
  cat1 = Category.create!(name: 'Biked')
  cat2 = Category.create!(name: 'Trike')
  desc1 = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo"
  desc2 = "consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
  names = ["bread.jpg", "china.jpg", "firebike.jpg", "squarebike.jpg", "ima.jpg", "rakes.jpg"]
  n = 0
  6.times do |x|
    x%2==0 ? 
    bike = Bicycle.create!(name: 'Biked'+(n+=1).to_s, description: desc1, category_id: cat1.id)
    :
    bike = Bicycle.create!(name: 'Biked'+(n+=1).to_s, description: desc2, category_id: cat2.id)
    pic = Pic.new
    pic.image = File.open("./app/assets/images/"+names[x])
    bike.pic = pic
  end
  
end