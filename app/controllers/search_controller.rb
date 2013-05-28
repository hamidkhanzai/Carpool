class SearchController < ApplicationController

  def index
    
   @routs = Rout.search(params[:d_from],[:d_to],[:tarvel_date])
  
  
  end
  def list
    @routs = Rout.where("price=?", '33')

  end
end
