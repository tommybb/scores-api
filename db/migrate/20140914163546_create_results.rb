class CreateResults < ActiveRecord::Migration
  def change
    create_table :results do |t|
      t.date :result_date
      t.decimal :score
      t.belongs_to :user, index: true
      t.belongs_to :competition, index: true

      t.timestamps
    end
  end
end
