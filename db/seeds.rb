# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first
User.create(
  email: "foo@example.com",
  password: "123qweASD",
  password_confirmation: "123qweASD",
  confirmed_at: Time.current,
  admin: true
  owner: true
)
