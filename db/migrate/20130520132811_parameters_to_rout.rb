class ParametersToRout < ActiveRecord::Migration
  def change
    add_column :routs, :free_seats, :integer
    add_column :routs, :price, :string
    add_column :routs, :date, :date
  end

  def down
  end
end
