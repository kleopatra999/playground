require 'spec_helper'

describe "Topics" do
  describe "GET /topics" do
    it "Display topics" do
      Topic.create!(title: 'Hello World!', content: 'Hello World!')
      get topics_path
      response.body.should include('Hello World!')
    end
  end

  describe "POST /topics" do
    it "Create topic" do
      Topic.create!(title: 'Hello World!', content: 'Hello World!')
      post_via_redirect topics_path, topic: { title: 'topic1', content: 'content 1' }
      response.body.should include('topic1')
    end
  end
end
