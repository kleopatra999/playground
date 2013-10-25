require 'spec_helper'

describe "Topics" do
  describe "GET /topics" do
    it "Display topics" do
      Topic.create!(title: 'Hello World!', content: 'Hello World!')
      visit topics_path
      page.should have_content('Hello World!')
    end
  end

  describe "POST /topics" do
    it "Create topic" do
      visit new_topic_path
      fill_in "Title", with: "topic1"
      fill_in "Content", with: "content 1"
      click_button "Create Topic"
      page.should have_content("Topic was successfully created.")
      page.should have_content("topic1")
    end
  end
end
