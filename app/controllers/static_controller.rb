class StaticController < ApplicationController
  def home
    render layout: 'carousel'
  end
end
