# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
DatabaseCleaner.clean_with(:truncation)

c1 = Cat.create!(birth_date: "2015/01/20", color: "Orange", name: "Harold", sex: "M", description: "funky",)
c2 = Cat.create!(birth_date: "2014/02/07", color: "Black", name: "Caroline", sex: "F", description: "Sleepy",)
c3 = Cat.create!(birth_date: "2020/05/28", color: "White", name: "Terra", sex: "F", description: "Funny",)
c4 = Cat.create!(birth_date: "2013/05/28", color: "White", name: "Tomy", sex: "M", description: "Ugly",)

cr1 = CatRentalRequest.create!(cat_id: c1.id, status: "APPROVED", start_date: '2020/01/01', end_date: '2020/01/02')
cr2 = CatRentalRequest.create!(cat_id: c1.id, status: "APPROVED", start_date: '2020/01/05', end_date: '2020/01/07')
cr3 = CatRentalRequest.create!(cat_id: c1.id, status: "APPROVED", start_date: '2020/01/15', end_date: '2020/01/18')

