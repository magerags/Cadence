# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "running seeds..."

UserSetting.destroy_all
User.destroy_all
Event.destroy_all
Category.destroy_all

tom = User.create!(email: 'tom@tom.com', password: '123456')

tom_settings = UserSetting.create!(
  user: tom,
  bed_time: Time.new(1970, 1, 1, 22, 0, 0),
  wake_time: Time.new(1970, 1, 1, 8, 0, 0),
  work_start: Time.new(1970, 1, 1, 9, 0, 0),
  work_end: Time.new(1970, 1, 1, 17, 0, 0)
  )

Category.create!(name: 'Socialising')
Category.create!(name: 'Eating')
Category.create!(name: 'Hobby')
Category.create!(name: 'Chores')
Category.create!(name: 'Chilling')
Category.create!(name: 'Coding')
Category.create!(name: 'Gym')
Category.create!(name: 'Running')


Event.create!(
  user: tom,
  category: Category.find(rand(0..8)),
  name: 'Test event 1',
  description: 'This is a test of the events model',
  repeatable: false,
  starting_time: DateTime.now,
  ending_time: DateTime.now + 1.hours,
  )

Event.create!(
  user: tom,
  category: Category.find(rand(0..8)),
  name: 'Test event 2',
  description: 'This is the second test of the events model',
  repeatable: false,
  starting_time: DateTime.now + 2.hours,
  ending_time: DateTime.now + 4.hours,
  )

puts "done!"
