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
            {:email=>"advisor1@advisor1.com", :password=>"mexicourbano", :name=>"Juan Perez", :phone=>"664-661-12-50", :community=>"Loma Alta, Linares"},
            {:email=>"advisor2@advisor2.com", :password=>"mexicourbano", :name=>"Miguel Martinez", :phone=>"554-323-23-40", :community=>"El Galeme, Montemorelos"}
]

troopers = [
            {:email=>"trooper1@trooper1.com", :password=>"mexicourbano", :advisor_id=>1, :name=>"Emeregildo Petra", :student_number=> "A02910831", :semester=> 4},
            {:email=>"trooper2@trooper2.com", :password=>"mexicourbano", :advisor_id=>1, :name=>"Israel Perez", :student_number=>"A04514268", :semester=> 3}
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
    a.name = attributes[:name]
    a.phone = attributes[:phone]
    a.community = attributes[:community]
  end
end

troopers.each do |attributes|
  Trooper.create do |t|
    t.email = attributes[:email]
    t.password = attributes[:password]
    t.advisor_id = attributes[:advisor_id]
    t.name = attributes[:name]
    t.student_number = attributes[:student_number]
    t.semester = attributes[:semester]
  end
end
