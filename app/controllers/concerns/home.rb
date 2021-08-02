module Home
  extend ActiveSupport::Concern

  def coordinates
    @users.map{ |user| { lat: JSON.parse(user.coordinates)[0], lng: JSON.parse(user.coordinates)[1]}}
  end
end