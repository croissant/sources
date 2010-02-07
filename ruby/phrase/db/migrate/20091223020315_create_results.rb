class CreateResults < ActiveRecord::Migration
  def self.up
    create_table :results do |t|
      t.column :phrase_id, :integer, :null => false
      t.column :result, :bool, :null => false
      t.column :created_at, :timestamp
    end
  end

  def self.down
    drop_table :results
  end
end
