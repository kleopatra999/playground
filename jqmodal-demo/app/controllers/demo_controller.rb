class DemoController < ApplicationController
  def index
    respond_to do |format|
      format.html
    end
  end

  def show
    sleep 1

    respond_to do |format|
      format.js
    end
  end

  def submit
    respond_to do |format|
      format.js
    end
  end
end
