class Topic < ActiveRecord::Base
  extend Enumerize

  attr_accessible :content, :title, :visible

  enumerize :visible, in: [ :public, :private ], default: :public
end
