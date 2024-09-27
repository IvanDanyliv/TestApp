ActiveAdmin.register Project do
  active_admin_paranoia

  config.per_page = 5

  permit_params :photo, :preview_photo, :old_photo, :new_photo,
                :project_type, :status, :individual_type, :individual_type_en,
                :name, :name_en, :title, :title_en, :short_description,
                :short_description_en, :description, :description_en,
                :site, :url_facebook, :need_amount, :slug,
                video_attributes: [:id, :title]

  form do |f|
    f.inputs 'Project' do
      f.input :photo
      f.input :preview_photo
      f.input :old_photo
      f.input :new_photo
      f.input :project_type
      f.input :status
      f.input :individual_type
      f.input :individual_type_en
      f.input :name
      f.input :name_en
      f.input :slug
      f.input :title
      f.input :title_en
      f.input :short_description, as: :quill_editor
      f.input :short_description_en, as: :quill_editor
      f.input :description, as: :quill_editor
      f.input :description_en, as: :quill_editor
      f.input :site
      f.input :url_facebook
      f.input :need_amount
      f.has_many :video, allow_destroy: false do |u|
        u.input :title
      end
      f.submit
    end
  end

  index pagination_total: true do
    column :id
    column :photo
    column :preview_photo
    column :old_photo
    column :new_photo
    column :project_type
    column :status
    column :individual_type
    column :individual_type_en
    column :name
    column :name_en
    column :slug
    column :title
    column :title_en
    column :short_description do |n|
      raw(n.short_description)
    end
    column :short_description_en do |n|
      raw(n.short_description_en)
    end
    column :description do |n|
      raw(n.description)
    end
    column :description_en do |n|
      raw(n.description_en)
    end
    column :site
    column :url_facebook
    column :need_amount
    actions
  end

  show do
    attributes_table do
      row :photo
      row :preview_photo
      row :old_photo
      row :new_photo
      row :project_type
      row :status
      row :individual_type
      row :individual_type_en
      row :name
      row :name_en
      row :slug
      row :title
      row :title_en
      row :short_description do |n|
        raw(n.short_description)
      end
      row :short_description_en do |n|
        raw(n.short_description_en)
      end
      row :description do |n|
        raw(n.description)
      end
      row :description_en do |n|
        raw(n.description_en)
      end
      row :site
      row :url_facebook
      row :need_amount
      row :video, :title do |v|
        raw (v.video.title)
      end
    end
    active_admin_comments
  end
end