class Content < ApplicationRecord
  has_one_attached :image
  has_many :content_followings, dependent: :destroy

  validates :title, presence: true
  validates :caption, presence: true
  validates :public_link, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["title"]
  end

# ログイン中のユーザーがそのコンテンツに対してフォローをしているか
  def content_followed?(user)
   content_followings.where(user_id: user.id).exists?
  end

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_content_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
