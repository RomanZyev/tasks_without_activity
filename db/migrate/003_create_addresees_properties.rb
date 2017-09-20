class CreateAddreseesProperties < ActiveRecord::Migration
   def change
    create_table :addresees_properties do |t|
      t.belongs_to  :addresee, index: true
      t.belongs_to  :project, index: true
    end
   
  end
  
  def self.down
    drop_table :addresees_properties
  end
end
