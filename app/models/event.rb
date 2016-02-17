class Event < ActiveRecord::Base
  belongs_to :user
  has_many :joins
  has_many :join_users, through: :joins, source: :user
  has_many :comments
  has_many :user_comments, through: :comments, source: :user
  validates :name, :event_date,:location, :state, presence: true
  validates :state, length: {is:2}
  validate :event_date_cannot_be_blank
  def event_date_cannot_be_blank
    errors.add(:event_date, "cannot be in the past") if 
      !event_date.blank? and event_date <Date.today
  end
end
