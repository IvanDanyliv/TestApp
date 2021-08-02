# frozen_string_literal: true
class User < ApplicationRecord
  acts_as_paranoid
  before_create :add_coordinates
  before_update :add_coordinates

  SOCIALS = {
    facebook: 'Facebook',
    google_oauth2: 'Google'
  }.freeze
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :omniauthable, omniauth_providers: %i[facebook google_oauth2]

  scope :for_map, -> { where.not(coordinates: nil) }

  def self.from_omniauth(auth) # rubocop:disable Metrics/MethodLength
    name_split = auth.info.name.split(' ')
    user = User.find_by(email: auth.info.email)
    user ||= User.create(
      provider: auth.provider,
      uid: auth.uid,
      last_name: name_split[1],
      first_name: name_split[0],
      email: auth.info.email,
      password: Devise.friendly_token[0, 20]
    )
    user
  end

  private

  def add_coordinates
    self.coordinates = Geocoder.coordinates(city)
  end
end
