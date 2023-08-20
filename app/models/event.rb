class Event < ApplicationRecord
  belongs_to :content

  validates :title, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :unique_event_content

  def self.ransackable_attributes(auth_object = nil)
    ["title","place","start_time"]
  end
  
  private

  def unique_event_content
    existing_event = content.events.find_by(title: title, start_time: start_time, end_time: end_time, place: place)
    if existing_event && existing_event != self
      errors.add(:base, "このイベントは登録されています。")
    end
  end

end
