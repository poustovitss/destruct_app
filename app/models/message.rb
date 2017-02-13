class Message < ActiveRecord::Base
  validates :content, :ttl, presence: true

  before_create :set_viewed

  def add_view
    counter!
  end

  private
  def counter!
    self.viewed += 1
    save!
  end

  def set_viewed
    self.viewed = -1
  end
end
