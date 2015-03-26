class Topic < ActiveRecord::Base
  belongs_to :forum
  belongs_to :user
  has_many :posts

  validates_presence_of :name
end
