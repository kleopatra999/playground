class Topic < ActiveRecord::Base
  extend Enumerize

  attr_accessible :content, :title, :public

  enumerize :public, in: { :public => true, :private => false }, default: :public
end
