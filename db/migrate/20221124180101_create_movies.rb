class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :duration
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :classroom, null: false, foreign_key: true

      t.timestamps
    end
  end
end
