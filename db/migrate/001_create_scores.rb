require_relative '../../config/application'

class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.string :player_name
      t.integer :score
      t.timestamps
    end
  end
end
