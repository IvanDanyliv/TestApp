# frozen_string_literal: true

class AddMapsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :city, :string
    add_column :users, :coordinates, :string
  end
end
