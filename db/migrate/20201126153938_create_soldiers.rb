class CreateSoldiers < ActiveRecord::Migration[6.0]
  def change
    create_table :soldiers do |t|
      t.string :svc_number
      t.string :rank
      t.string :name
      t.string :gender
      t.date :dob
      t.string :unit

      t.timestamps
    end
  end
end
