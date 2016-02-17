class User < ActiveRecord::Base
  has_secure_password
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  has_many :events
  has_many :joins
  has_many :join_events, through: :joins, source: :event
  has_many :comments
  has_many :event_comments, through: :comments, source: :event
  validates :first_name,:last_name,:email,:location,:state,:password, presence: true
  validates :password, length: {minimum:8}
  validates :email, format: { with: EMAIL_REGEX }
  validates :state, length:{is:2}
end
#user has many events too(one user can create lots of events)