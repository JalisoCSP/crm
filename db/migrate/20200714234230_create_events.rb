class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.references :contact

      t.string :title
      t.date :date
      t.text :notes

      t.timestamps
    end
  end
end
