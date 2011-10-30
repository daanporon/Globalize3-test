class CreateProducts < ActiveRecord::Migration
  
  def up
    create_table :products do |t|
      t.decimal :price

      t.timestamps
    end
    Product.create_translation_table! :title => :string, :description => :text
  end
  
  def down
    drop_table :products
    Product.drop_translation_table!
  end
end
