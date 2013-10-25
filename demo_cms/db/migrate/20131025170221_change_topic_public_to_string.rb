class ChangeTopicPublicToString < ActiveRecord::Migration
  def up
    change_column :topics, :public, :string
    rename_column :topics, :public, :visible
  end

  def down
    rename_column :topics, :visible, :public
    change_column :topics, :public, :boolean
  end
end
