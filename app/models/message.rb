class Message < ActiveRecord::Base
  validates :content, :init_views, presence: true,
                                   length: { minimum: 0 },
                                   allow_nil: true
  validates :ttl, numericality: { greater_than_or_equal_to: 1,
                                  less_then: 10**10-1,
                                  only_integer: true },
                  allow_nil: true
  validates :init_views, numericality: { greater_than_or_equal_to: 1,
                                         less_then: 10**10-1,
                                         only_integer: true }


  before_create :set_init_viewed


  def is_expired?
    value = ( Time.now - self.created_at ) <=> self.ttl
    if value == 1
      set_nil_content
      true
    else
      false
    end
  end

  def increase_view
    increment
  end

  protected
  def increment
    self.viewed += 1
    save!
  end

  def set_nil_content
    self.content = nil
    save!
  end

  def set_init_viewed
    self.viewed = -1
  end
end
