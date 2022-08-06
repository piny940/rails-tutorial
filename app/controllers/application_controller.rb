class ApplicationController < ActionController::Base
  def show
    render html: 'hello world'
  end
end
