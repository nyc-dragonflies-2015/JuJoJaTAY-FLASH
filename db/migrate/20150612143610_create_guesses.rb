class CreateGuesses < ActiveRecord::Migration
  def change
    create_table :guesses do |t|
      t.belongs_to :round
      t.belongs_to :card
      t.boolean :correct, default: false

      t.timestamps
    end
  end
end
