class Post < ApplicationRecord
  belongs_to :user
  has_many :ip_list
  has_many :marks
end
