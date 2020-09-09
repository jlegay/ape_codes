class CreateCodes < ActiveRecord::Migration[6.0]
  def change
    create_table :codes do |t|
      t.integer :number
      t.string :name
      t.text :included
      t.text :not_included

      t.timestamps
    end
  end
end
