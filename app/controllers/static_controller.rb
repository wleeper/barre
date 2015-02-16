class StaticController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]
  def home
    render layout: 'carousel'
  end
  
  def dashboard
  end
  
end
