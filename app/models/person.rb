# == Schema Information
#
# Table name: people
#
#  id                   :integer          not null, primary key
#  name                 :string(255)
#  parties_count        :integer
#  participations_count :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Person < ActiveRecord::Base
  attr_accessible :name

  before_create { self.name = Faker::Name.name.gsub(" ","").gsub(".","").gsub("'","") }


  has_and_belongs_to_many :friends, class_name: "Person",
  																 foreign_key: "self_id",
  										 association_foreign_key: "friend_id",
  										 							join_table: "friendships",
  										 										uniq: true




  has_many :own_parties, class_name: "Party",
  											foreign_key: "organizer_id"


	has_many :party_participations, foreign_key: "attendee_id"

	has_many :attended_parties, through: :party_participations





 	def befriend(person)
 		unless self.friends.include?(person)
 			self.friends << person
 			return true
 		else
 			return false
 		end
 	end

end
