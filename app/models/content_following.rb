class ContentFollowing < ApplicationRecord
  belongs_to :end_user
  belongs_to :content

end
