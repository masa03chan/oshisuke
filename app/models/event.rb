class Event < ApplicationRecord
  belongs_to :user
  belongs_to :content

  validates :title, presence: true
  validates :start_time, presence: true
  validates :place, presence: true
  validates :date, presence: true
  validates :caption, presence: true

  def self.ransackable_attributes(auth_object = nil)
    ["title","place","date"]
  end

end
