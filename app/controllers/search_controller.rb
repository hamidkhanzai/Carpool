class SearchController < ApplicationController

  def index
  @routs = Rout.all
  
  end
end
