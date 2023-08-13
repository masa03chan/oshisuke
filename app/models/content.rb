class Content < ApplicationRecord
  has_one_attached :image
  has_many :content_followings, dependent: :destroy

  def self.ransackable_attributes(auth_object = nil)
    ["title"]
  end

# ログイン中のユーザーがそのコンテンツに対してフォローをしているか
  def content_followed?(user)
   content_followings.where(user_id: user.id).exists?
  end
end
