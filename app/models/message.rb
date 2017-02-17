class Message < ActiveRecord::Base
  validates :content, presence: true
  validates :ttl, presence: true, numericality: { greater_than_or_equal_to: 1,
                                  less_than: 30*24*60*60,
                                  only_integer: true }
  validates :init_views, presence: true, numericality: { greater_than_or_equal_to: 1,
                                         less_than: 1000,
                                         only_integer: true }


  before_create :set_init_viewed
  after_create  :set_unique_hash


  def is_expired?
    ( Time.now.utc - self.created_at ) > self.ttl || self.init_views == self.viewed
  end

  def has_password?
    self.has_password
  end

  def increase_view
    self.viewed += 1
    save!
  end

  def set_nil_content
    self.content = 'none'
    save!
  end

  protected
  def set_init_viewed
    self.viewed = -1
  end

  def set_unique_hash
    self.unique_hash = Digest::SHA1.hexdigest(self.id.to_s)
    save!
  end
end
