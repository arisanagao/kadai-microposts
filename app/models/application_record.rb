class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  has_many :favorites
  has_many :favorite_nows, through: :favorites, source: :post
  has_many :postowners, through: :favorite_nows, source: :user
  
  
  def favorite_on(micropost)
    self.favorites.find_or_create_by(post_id: micropost.id)
  end

  def favorite_off(micropost)
    favorite = self.favorites.find_by(post_id: micropost.id)
    favorite.destroy if favorite
  end

  def favorite_now?(micropost)
    self.favorite_nows.include?(micropost)
  end
  
  
end
