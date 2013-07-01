class AddColumnsToUsers < ActiveRecord::Migration
  def change
  add_column('users','uid',:string)
  add_column(:users,'provider',:string)
  add_column(:users,'isDriver',:boolean)
    add_column(:users,'imgPath',:string)
  end
end
