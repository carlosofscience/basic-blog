class PagesController < ApplicationController
  def about
    @title  = 'About us'
    @content = 'This is the about page, it auto reloads?, sweet.'
  end
end
