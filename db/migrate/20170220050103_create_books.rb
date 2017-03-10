class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :name
      t.string :address
      t.string :number
      t.string :email

      t.timestamps
    end
  end
end
