# coding: utf-8

require 'girl'

describe Girl do
  subject { Girl.new }

  its(:chance?) { should be_true, '女孩被把了！' }

  it 'taken!' do
    subject.taken!
    subject.should_not be_chance, '没有戏'
  end
end
