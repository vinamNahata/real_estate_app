class CreateInteresteds < ActiveRecord::Migration[7.1]
  def change
    create_table :interesteds do |t|
      t.references :user, null: false, foreign_key: true
      t.references :property, null: false, foreign_key: true

      t.timestamps
    end
  end
end
