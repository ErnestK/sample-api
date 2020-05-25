class CreateTrades < ActiveRecord::Migration
  def change
    create_table :trades do |t|
      t.string      :symbol, null: false
      t.belongs_to  :user
      t.float       :price
      t.integer     :shares
      t.string      :type

      t.timestamps null: false
    end
  end
end
