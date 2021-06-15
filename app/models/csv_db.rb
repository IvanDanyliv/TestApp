require 'csv'
class CsvDb
  DEFAULT_PASSWORD = '123qwe!'.freeze

  class << self
    def convert_save(model_name, csv_data)
      CSV.read(csv_data, headers: true).each do |row|
        attributes = row.to_h.transform_keys do |k|
          k.split.map(&:downcase).join('_')
        end
        attributes[:password] ||= DEFAULT_PASSWORD
        attributes[:password_confirmation] ||= DEFAULT_PASSWORD
        target_model = model_name.classify.constantize
        target_model.create!(**attributes)
      end
    end
  end
end