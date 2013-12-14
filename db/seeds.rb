# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
	categories = Category.create([{ name: 'Transportation', description: 'Transportation' }, 
		{ name: 'Education', description: 'Education' }, 
		{ name: 'Health', description: 'Health' }, { name: 'Sanitation', description: 'Sanitation' } ])
	tags = Tag.create([{ name: 'Feedback', description: 'Feedback' }, { name: 'Suggestion', description: 'Suggestion' }])
	