class CreateCatRentalRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :cat_rental_requests do |t|
      t.integer :cat_id, null: true 
      t.date :start_date, null: true 
      t.date :end_date, null: true 
      t.string :status, null: true, default: 'PENDING' 

      t.index :cat_id 
      t.timestamps
    end
  end
end
