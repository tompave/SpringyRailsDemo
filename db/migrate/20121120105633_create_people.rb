class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
    	t.string :name


    	t.integer :parties_count
    	t.integer :participations_count

      t.timestamps
    end
    add_index :people, :name
  end
end
