# == Schema Information
#
# Table name: party_participations
#
#  id                :integer          not null, primary key
#  confirmed         :boolean          default(FALSE)
#  attendee_id       :integer
#  attended_party_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class PartyParticipation < ActiveRecord::Base
  attr_accessible :confirmed, :attendee_id


  belongs_to :attendee, class_name: "Person",
  										 foreign_key: "attendee_id",
  									 counter_cache: "participations_count"


  belongs_to :attended_party, class_name: "Party",
  													 foreign_key: "attended_party_id",
  												 counter_cache: "participations_count"



  def accept!
  	self.update_attributes(confirmed: true)
  end

  
end
