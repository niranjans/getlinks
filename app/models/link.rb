class Link < ActiveRecord::Base
  belongs_to :user
  acts_as_list
end
