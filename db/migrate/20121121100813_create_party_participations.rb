class CreatePartyParticipations < ActiveRecord::Migration
  def change
    create_table :party_participations do |t|

    	t.boolean :confirmed, default: false

    	t.integer :attendee_id
    	t.integer :attended_party_id

      t.timestamps
    end
  end
end
