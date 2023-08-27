class EndUser < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :profile_image

  has_many :events, dependent: :destroy
  has_many :bookmarks, dependent: :destroy #マイイベントカレンダー用
  has_many :content_followings, dependent: :destroy #コンテンツのフォロー用

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, presence: true
  validates :email, presence: true
  validates :encrypted_password, presence: true

  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |end_user|
      end_user.password = SecureRandom.urlsafe_base64
      end_user.password_confirmation = end_user.password
      end_user.name = "ゲスト"
      end_user.caption = "ゲストユーザーです。"
    end
  end

  def get_profile_image(width, height)
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_content_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end
end
