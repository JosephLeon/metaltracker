class CreateSilvers < ActiveRecord::Migration
  def change
    create_table :silvers do |t|
      t.string :name
      t.decimal :silver_amount
      t.date :date_purchased
      t.text :notes
      t.decimal :price_paid

      t.timestamps null: false
    end
  end
end
