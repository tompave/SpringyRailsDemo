class Person < ActiveRecord::Base
  attr_accessible :name

  before_create { self.name = Faker::Name.name.gsub(" ","").gsub(".","").gsub("'","") }


  has_and_belongs_to_many :friends, class_name: "Person",
  																 foreign_key: "self_id",
  										 association_foreign_key: "friend_id",
  										 							join_table: "friendships",
  										 										uniq: true

 	def befriend(person)
 		unless self.friends.include?(person)
 			self.friends << person
 			return true
 		else
 			return false
 		end
 	end

end
