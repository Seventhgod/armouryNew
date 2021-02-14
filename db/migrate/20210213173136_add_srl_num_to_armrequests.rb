class AddSrlNumToArmrequests < ActiveRecord::Migration[6.1]
  def change
    add_column :armrequests, :srl_num, :string
  end
end
