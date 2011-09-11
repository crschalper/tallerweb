class EstaticoController < ApplicationController
before_filter :authenticate_user!, :except => [:index]
  def index
  end
  
  def profile
 
end

end
