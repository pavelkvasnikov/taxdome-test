class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false, index: true
      t.references :article, foreign_key: true

      t.timestamps
    end
  end
end
