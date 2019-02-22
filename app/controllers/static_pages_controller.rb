class StaticPagesController < ApplicationController

  def home
    @datasets  = Dataset.all
  end

  def help
  end
  
  def about
  end

  def contact
  end
end
