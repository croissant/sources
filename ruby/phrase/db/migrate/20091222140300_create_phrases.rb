class CreatePhrases < ActiveRecord::Migration
  def self.up
    create_table :phrases do |t|
      t.column :phrase, :string, :null => false
      t.column :detail, :string, :null => false
      t.column :created_at, :timestamp
    end
  end

  def self.down
    drop_table :phrases
  end
end
