# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admins = [
            {:email=>"admin@admin.com", :password=>"mexicourbano"}
]
          
advisors = [
            {:email=>"advisor1@advisor1.com", :password=>"mexicourbano"},
            {:email=>"advisor2@advisor2.com", :password=>"mexicourbano"}
]
          
troopers = [
            {:email=>"trooper1@trooper2.com", :password=>"mexicourbano"},
            {:email=>"trooper1@trooper.com", :password=>"mexicourbano"}
]

admins.each do |attributes|
  Admin.create do |a|
    a.email = attributes[:email]
    a.password = attributes[:password]
  end
end

advisors.each do |attributes|
  Advisor.create do |a|
    a.email = attributes[:email]
    a.password = attributes[:password]
  end
end   

troopers.each do |attributes|
  Trooper.create do |t|
    t.email = attributes[:email]
    t.password = attributes[:password]
  end
end 