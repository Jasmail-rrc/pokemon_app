class CreatePokemons < ActiveRecord::Migration[8.1]
  def change
    create_table :pokemons do |t|
      t.string :name
      t.integer :height
      t.integer :weight
      t.string :image_url
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
