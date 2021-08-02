class Project < ApplicationRecord
  acts_as_paranoid

  has_one :video, dependent: :destroy
  accepts_nested_attributes_for :video, allow_destroy: true


  validates :project_type, :status, :individual_type, :individual_type_en,
            :name, :name_en, :title, :title_en, :short_description,
            :short_description_en, :description, :description_en,
            :need_amount, presence: true

  mount_uploader :photo, PhotoUploader
  mount_uploader :preview_photo, PhotoUploader
  mount_uploader :new_photo, PhotoUploader
  mount_uploader :old_photo, PhotoUploader

  enum project_type: [:project, :program]
  PROJECT_TYPES = { project: "project", program: "program" }.freeze

  enum status: [:development, :implemented]
  STATUSES = { development: "development", implemented: "implemented" }.freeze

  scope :find_status, ->  (status) {
    if status.blank?
      all
    else
      where(status: status)
    end
  }
end
