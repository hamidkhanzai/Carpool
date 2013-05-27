class SearchController < ApplicationController

  def index
    
   @routs = Rout.search(params[:d_from],[:d_to])
  
  
  end
end
