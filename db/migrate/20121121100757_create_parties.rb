class CreateParties < ActiveRecord::Migration
  def change
    create_table :parties do |t|

    	t.string :theme
    	t.string :venue


    	t.integer :organizer_id
    	t.integer :participations_count

      t.timestamps
    end
  end
end
