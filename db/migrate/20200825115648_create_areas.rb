class CreateAreas < ActiveRecord::Migration[6.0]
  def change
    create_table :areas do |t|
      t.string :name, null: false
      t.timestamps
    end
    # add_index :areas
  end
end
