class SearchController < ApplicationController

  def index
  @routs = Rout.all
  
  end
  def list
    @routs = Rout.where("price=?", '33')

  end
end
