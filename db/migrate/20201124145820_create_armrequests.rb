class CreateArmrequests < ActiveRecord::Migration[6.0]
  def change
    create_table :armrequests do |t|
      t.string :personnel
      t.string :arm_type
      t.string :arm
      t.integer :quantity
      t.string :user
      t.date :request_date
      t.date :return_date

      t.timestamps
    end
  end
end
