class Possibility < ActiveRecord::Base
  belongs_to :user
  belongs_to :event
  has_many :date_events
end
