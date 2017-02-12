class Message < ActiveRecord::Base
  validates :content, :ttl, presence: true

end
