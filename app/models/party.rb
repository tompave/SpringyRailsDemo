# == Schema Information
#
# Table name: parties
#
#  id                   :integer          not null, primary key
#  theme                :string(255)
#  venue                :string(255)
#  organizer_id         :integer
#  participations_count :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class Party < ActiveRecord::Base
  attr_accessible :theme, :venue


  before_create :fill_fields


  belongs_to :organizer, class_name: "Person",
                        foreign_key: "organizer_id",
                      counter_cache: "parties_count"

  has_many :party_participations, foreign_key: "attended_party_id"

  has_many :attendees, through: :party_participations





  def attend!(person, accept = false)
    if !self.attendees.include?(person) && self.organizer_id != person.id
      participation = self.party_participations.build(
                              attendee_id: person.id,
                              confirmed: accept)
      participation.save ? participation : false
    else
      return false
    end
  end








  private

    def fill_fields
      self.theme = random_theme
      self.venue = random_venue
    end

    def random_theme
      key = Random.new.rand(0..4)
      case key
        when 0 then "Spooky"
        when 1 then "Far West"
        when 2 then "Ancient Rome"
        when 3 then "Beach"
        when 4 then "Formal"
      end
    end

    def random_venue
      key = Random.new.rand(0..4)
      case key
        when 0 then "Ball House"
        when 1 then "Park"
        when 2 then "Disco"
        when 3 then "Pub"
        when 4 then "Home"
      end
    end


end
