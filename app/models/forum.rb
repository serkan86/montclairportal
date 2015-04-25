class Forum < ActiveRecord::Base
  audited
  has_many :topics

  validates_presence_of :name
end
