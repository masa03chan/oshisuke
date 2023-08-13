class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_one_attached :image
  mount_uploader :avatar, AvatarUploader

  has_many :events, dependent: :destroy
  has_many :bookmarks, dependent: :destroy #マイイベントカレンダー用
  has_many :content_followings, dependent: :destroy #コンテンツのフォロー用

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable


end
