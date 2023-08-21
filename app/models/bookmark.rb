class Bookmark < ApplicationRecord
  belongs_to :end_user
  belongs_to :event
  belongs_to :content
end
