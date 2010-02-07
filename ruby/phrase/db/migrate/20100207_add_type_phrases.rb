class AddTypePhrases < ActiveRecord::Migration
  def self.up
    add_column :phrases, :type_id, :integer
  end

  def self.down
    remove_column :phrases, :type
  end
end
