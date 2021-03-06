namespace :db do
	desc "Fill Database with values"
	task :populate => :environment do
		[Feedback, Vote, Downvote, Admin, Category, Tag].each(&:delete_all)
		
		categories = Category.create([{ name: 'Transportation', description: 'Transportation' }, { name: 'Education', description: 'Education' }, 
			{ name: 'Health', description: 'Health' }, { name: 'Sanitation', description: 'Sanitation' } ])
		
		tags = Tag.create([{ name: 'Feedback', description: 'Feedback' }, { name: 'Suggestion', description: 'Suggestion' }])
		
		categories.each do |category|
			admin = Admin.new(name: Faker::Name.name, email: Faker::Internet.email, sign_in_count: 0, password: 
				'Admin123')
			admin.category_id = category.id
			admin.save
		end

		category_first = Category.first.id
		category_last = Category.last.id

		tag_first = Tag.first.id
		tag_last = Tag.last.id

		Feedback.populate 100 do |feedback|
			feedback.heading = Populator.words(1..5).titleize
			feedback.feedback_content = Faker::Lorem.paragraph(sentence_count = 15, supplemental = false, random_sentences_to_add = 5)
			feedback.when = 2.years.ago..Time.now
			feedback.where = 'Chennai'
			feedback.votes_count = 0
			feedback.user_id = User.find_by_email("sudhar.ti@gmail.com")
			feedback.category_id = Category.find(Random.new.rand(category_first..category_last)).id
			feedback.tag_id = Tag.find(Random.new.rand(tag_first..tag_last)).id
		end

	end
end