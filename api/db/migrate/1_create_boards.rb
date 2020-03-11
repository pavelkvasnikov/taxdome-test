class CreateBoards < ActiveRecord::Migration[6.0]
  def change
    create_table :boards do |t|
      t.string :name, null: false, index: true, uniq: true
      t.string :link, null: false, index: true, uniq: true

      t.timestamps
    end
  end
end
