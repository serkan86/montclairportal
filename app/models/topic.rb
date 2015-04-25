class Topic < ActiveRecord::Base
  audited
  belongs_to :forum
  belongs_to :user
  has_many :posts

  validates_presence_of :name
end
