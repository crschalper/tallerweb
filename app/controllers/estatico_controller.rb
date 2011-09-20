class EstaticoController < ApplicationController
before_filter :authenticate_user!, :except => [:index]
  def index
  end
  
  def profile
end

def user_list
@users = User.all
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @users }
end
end
def user_show
   @user = User.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @user }
    end

end
end
