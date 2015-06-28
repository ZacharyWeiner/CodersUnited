# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(email: "zack1@mbadojo.com", password: "password", username: "zw12345", password_confirmation:"password")
User.create(email: "zack2@mbadojo.com", password: "password", username: "zw12346", password_confirmation:"password")
User.create(email: "zack3@mbadojo.com", password: "password", username: "zw12347", password_confirmation:"password")
User.create(email: "zack4@mbadojo.com", password: "password", username: "zw12348", password_confirmation:"password")
User.create(email: "zack5@mbadojo.com", password: "password", username: "zw12349", password_confirmation:"password")


p "Test users creates"
