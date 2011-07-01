class AddEmailToDairy < ActiveRecord::Migration
  def self.up
    add_column :dairies, :email, :string
  end

  def self.down
    remove_column :dairies, :email
  end
end
