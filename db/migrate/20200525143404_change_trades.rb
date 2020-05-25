class ChangeTrades < ActiveRecord::Migration
  def change
    add_column :trades, :timestamp, :datetime
  end
end
