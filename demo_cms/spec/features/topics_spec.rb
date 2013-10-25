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
    it "Member can not create topic" do
      post_via_redirect email: 'greatghoul@gmail.com', password: '11111111'
      response.body.should include("Signed in successfuly.")

      visit new_topic_path
      fill_in "Title", with: "topic1"
      fill_in "Content", with: "content 1"
      click_button "Create Topic"
      page.should have_content("Topic was successfully created.")
      page.should have_content("topic1")
    end
  end
end
