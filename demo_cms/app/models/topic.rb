class Topic < ActiveRecord::Base
  extend Enumerize

  attr_accessible :content, :title, :visible

  enumerize :visible, in: [ :public, :private ], default: :public

  after_save :clear_topics_cache
  after_destroy :clear_topics_cache

  private
  def clear_topics_cache
    Rails.cache.delete_matched(/topics\/.*/)
  end
end
