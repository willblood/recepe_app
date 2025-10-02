class CreateRecipe < ActiveRecord::Migration[7.1]
  def change
    create_table :recipes, id: :uuid do |t|
      t.string :name, null: false
      t.text :ingredients, null: false
      t.text :instructions, null: false
      t.timestamps
    end
  end
end
