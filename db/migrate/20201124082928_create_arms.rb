class CreateArms < ActiveRecord::Migration[6.0]
  def change
    create_table :arms do |t|
      t.string :srl_num
      t.string :arm_name
      t.string :arm_type
      t.integer :quantity
      t.string :service_b

      t.timestamps
    end
  end
end
