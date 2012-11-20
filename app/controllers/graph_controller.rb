class GraphController < ApplicationController


	# GET / - root_path
	def home
		@names = Person.pluck(:name)
		@friendships = {}
		Person.all.each do |person|
			@friendships[person.name] = person.friends.pluck(:name)
		end
	end
	
	
	# POST /random - random_path
	def random(n = 10)
		Person.destroy_all

		n.times do |i|
			Person.create
		end
		
		prng = Random.new()
		people = Person.all
		r = 0..n-1
		30.times do |i|
			people[prng.rand(r)].befriend(people[prng.rand(r)])
		end

		redirect_to :root
	end
	

end
