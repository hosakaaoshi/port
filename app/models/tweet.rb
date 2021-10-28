class Tweet < ApplicationRecord
  attachment :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy, class_name: "Favorite"

  def favorited?(user)
    favorites.where(user_id: user.id).exists?
  end
end
