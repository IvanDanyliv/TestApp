# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.delete_all
AdminUser.delete_all
Project.delete_all

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?

100.times do
  User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    email: Faker::Internet.email,
    password: Faker::Internet.password,
    city: Faker::Address.city
  )
end

20.times do
  Project.create(
    photo: Faker::LoremPixel.image,
    preview_photo: Faker::LoremPixel.image,
    old_photo: Faker::LoremPixel.image,
    new_photo: Faker::LoremPixel.image,
    project_type: ['program', 'project'].sample,
    status: ['implemented', 'development'].sample,
    individual_type: Faker::Types.rb_string,
    individual_type_en: Faker::Types.rb_string,
    name: Faker::Company.name,
    name_en: Faker::Company.name,
    title: Faker::Book.title,
    title_en: Faker::Book.title,
    short_description: Faker::Movies::Hobbit.quote,
    short_description_en: Faker::Movies::Hobbit.quote,
    description: Faker::Lorem.sentence(word_count: 120),
    description_en: Faker::Lorem.sentence(word_count: 120),
    site: Faker::Lorem.word,
    url_facebook: Faker::Lorem.word,
    need_amount: Faker::Commerce.price
  )
end