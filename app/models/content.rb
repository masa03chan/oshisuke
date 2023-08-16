class Content < ApplicationRecord
  has_one_attached :image
  has_many :content_followings, dependent: :destroy
  has_many :events, dependent: :destroy

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

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/no_content_image.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

end
