class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :photo
      t.string :preview_photo
      t.string :old_photo
      t.string :new_photo
      t.integer :project_type
      t.integer :status
      t.string :individual_type
      t.string :individual_type_en
      t.string :name
      t.string :name_en
      t.string :title
      t.string :title_en
      t.string :short_description
      t.string :short_description_en
      t.text :description
      t.text :description_en
      t.string :site
      t.string :url_facebook
      t.decimal :need_amount

      t.timestamps
    end
  end
end
