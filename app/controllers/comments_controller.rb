class CommentsController < ApplicationController
	 before_filter :authenticate_user!
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
    @comments = Comment.paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @comments }
    end
  end

def desactivar
	com=Comment.find(params[:id])
	post = com.post_id
	com.active=false
	com.save
	
	respond_to do |format|
    
	format.html { redirect_to Post.find(post), :notice => 'Comentario desactivado.' }
        format.json { render :json => com, :status => :created, :location => com }
	end
end

def activar
	com=Comment.find(params[:id])
	post = com.post_id
	com.active=true
	com.save
	
	respond_to do |format|
    
	format.html { redirect_to Post.find(post), :notice => 'Comentario activado.' }
        format.json { render :json => com, :status => :created, :location => com }
	end
end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new
    
	if (!(params[:id_post].nil?))
		@post = Post.find(params[:id_post])
	end
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    respond_to do |format|
      if @comment.save
	
	@comment.active=true
    @comment.grade2=0
    @comment.save
        format.html { redirect_to Post.find(@comment.post_id), :notice => 'Comentario creado.' }
        format.json { render :json => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.json
  def update
    @comment = Comment.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @comment, :notice => 'Datos actualizados.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    post = @comment.post_id
    
    hijos = Comm.find(:all, :conditions=>{:father_id=>@comment.id})
    
	hijos.each do |hijo|
		nietos = Comm.find(:all, :conditions=>{:father_id=>hijo.son_id})
			nietos.each do |nieto|
				nieeeto = Comment.find(nieto.son_id)
				nieeeto.delete
				nieto.delete
			end
		comentario = Comment.find(hijo.son_id)
		comentario.delete
		hijo.delete
	end    
    @comment.destroy

    respond_to do |format|
      format.html { redirect_to Post.find(post)}
      format.json { head :ok }
    end
  end
end
