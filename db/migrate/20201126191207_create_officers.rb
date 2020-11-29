class CreateOfficers < ActiveRecord::Migration[6.0]
  def change
    create_table :officers do |t|
      t.string :svc_number
      t.string :rank
      t.string :name
      t.string :gender
      t.date :dob
      t.date :commission_date
      t.date :seniority_date

      t.timestamps
    end
  end
end
