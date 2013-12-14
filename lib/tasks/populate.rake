namespace :db do
	desc "Fill Database with values"
	task :populate => :environment do
		[User, Feedback, Vote, Downvote, Admin, Category, Tag].each(&:delete_all)
		categories = Category.create([{ name: 'Transportation', description: 'Transportation' }, 
			{ name: 'Education', description: 'Education' }, 
			{ name: 'Health', description: 'Health' }, { name: 'Sanitation', description: 'Sanitation' } ])
	end
end