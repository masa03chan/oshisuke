class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :profile_image

  has_many :bookmarks, dependent: :destroy #マイイベントカレンダー用
  has_many :content_followings, dependent: :destroy #コンテンツのフォロー用

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


  def get_profile_image
    unless profile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_profile_image.jpg')
      profile_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    profile_image.variant(resize_to_limit: [width, height]).processed
  end

end
