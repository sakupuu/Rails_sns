class Tweet < ApplicationRecord
  belongs_to :user
  has_many :favorites

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  has_many :comments

  scope :like_body, -> (body)  {
    where("body LIKE ?", "%#{body}%")
  }
end
