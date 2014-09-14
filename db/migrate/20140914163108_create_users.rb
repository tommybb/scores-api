class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.date :birth_date
      t.string :school_class
      t.string :email
      t.boolean :admin

      t.timestamps
    end
  end
end
