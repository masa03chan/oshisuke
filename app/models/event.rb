class Event < ApplicationRecord
  belongs_to :user
  belongs_to :content

  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["title","place","date"]
  end

end
