class CreateAddresees < ActiveRecord::Migration
  def change
    create_table :addresees do |t|
      t.string :email
    end
    Addresees.create :email => "nine@nineseven.ru", :id => 1
    Addresees.create :email => "zoe@nineseven.ru", :id => 2
  end
  def self.down
    drop_table :addresees
  end
end
