class PostsController < ApplicationController
	 before_filter :authenticate_user!, :except => [:show]
	 helper_method :sort_column, :sort_direction

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
    @posts = Post.paginate(:page => params[:page], :per_page => 10)
    
    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @posts }
    end
  end

def desactivar
	post=Post.find(params[:id])
	post.active=false
	post.save
	
	respond_to do |format|
    
	format.html { redirect_to post, :notice => 'Post desactivado.' }
        format.json { render :json => com, :status => :created, :location => com }
	end
end

def activar
	post=Post.find(params[:id])
	post.active=true
	post.save
	
	respond_to do |format|
    
	format.html { redirect_to post, :notice => 'Post activado.' }
        format.json { render :json => com, :status => :created, :location => com }
	end
end


  # GET /posts/1
  # GET /posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @post }
    end
  end

  # GET /posts/new
  # GET /posts/new.json
  def new
    @post = Post.new
    @post.active=true
    


    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @post }
    end
  end

  # GET /posts/1/edit
  def edit
    @post = Post.find(params[:id])
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(params[:post])
   
   respond_to do |format|
      if @post.save
        format.html { redirect_to @post, :notice => 'Post creado.' }
        format.json { render :json => @post, :status => :created, :location => @post }
      else
        format.html { render :action => "new" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /posts/1
  # PUT /posts/1.json
  def update
    @post = Post.find(params[:id])
     respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to @post, :notice => 'Datos actualizados.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @comments = Comment.find(:all, :conditions=>{:post_id=>@post.id})
    @comments.each do |comment|
	    comment.destroy
	    end
    @post.destroy

    respond_to do |format|
      format.html { redirect_to root_path}
      format.json { head :ok }
    end
  end

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  
  end
