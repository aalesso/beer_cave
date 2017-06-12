class CreateWines < ActiveRecord::Migration
  def change
    create_table :wines do |t|
      t.string :category
      t.string :name
      t.integer :user_id
      t.text :fellow_imbibers
      t.boolean :favorite
      t.integer :year
      t.integer :rating
      t.text :notes
      t.text :grape
      t.text :country
      t.string :photo

      t.timestamps

    end
  end
end
