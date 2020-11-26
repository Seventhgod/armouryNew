class CreateArmReturns < ActiveRecord::Migration[6.0]
  def change
    create_table :arm_returns do |t|
      t.string :personnel
      t.string :arm
      t.string :srl_num
      t.string :return_date

      t.timestamps
    end
  end
end
