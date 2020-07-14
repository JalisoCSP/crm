class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts do |t|
      t.references :user

      t.string :name
      t.string :company
      t.string :location
      t.string :email
      t.string :phone
      t.string :website
      t.string :twitter
      t.text :notes

      t.timestamps
    end
  end
end
