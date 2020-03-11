class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :name, null: false, index: true
      t.references :board, foreign_key: true

      t.timestamps
    end
  end
end
