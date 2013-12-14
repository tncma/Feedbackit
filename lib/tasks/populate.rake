namespace :db do
	desc "Fill Database with values"
	task :populate => :environment do
		[User, Feedback, Vote, Downvote, Admin, Category, Tag].each(&:delete_all)
		
		categories = Category.create([{ name: 'Transportation', description: 'Transportation' }, { name: 'Education', description: 'Education' }, 
			{ name: 'Health', description: 'Health' }, { name: 'Sanitation', description: 'Sanitation' } ])
		tags = Tag.create([{ name: 'Feedback', description: 'Feedback' }, { name: 'Suggestion', description: 'Suggestion' }])
		
		categories.each do |category|
			admin = Admin.new(name: Faker::Name.name, email: Faker::Internet.email, sign_in_count: 0, password: "Admin123")
			admin.category_id = category.id
			admin.save
		end

	end
end