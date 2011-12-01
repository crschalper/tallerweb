class CommsController < ApplicationController
	before_filter :authenticate_user!
  # GET /comms
  # GET /comms.json
  def index
    @comms = Comm.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @comms }
    end
  end

  # GET /comms/1
  # GET /comms/1.json
  def show
    @comm = Comm.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @comm }
    end
  end

  # GET /comms/new
  # GET /comms/new.json
  def new
    @comment = Comment.new
    @com = Comm.new
    @com.father_id = params[:id_comment]
    @com.son_id = Comment.find(params[:id_comment]).post_id
    @com.save
    @comment.active=true
    
    
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @comm }
    end
  end

  # GET /comms/1/edit
  def edit
    @comm = Comm.find(params[:id])
  end

  # POST /comms
  # POST /comms.json
  def create
@comment = Comment.new(params[:comment])
@comment.grade2=0
@comment.active=true
    respond_to do |format|
      if @comment.save
     
      com = Comm.last
      @comment.post_id = com.son_id
      @comment.save
      
        com.son_id = @comment.id
	com.save
	
	sum=0
	counter=0
	todospadre = Comm.find(:all, :conditions=>{:father_id=>com.father_id})
	todospadre.each do |hijo|
	comentario = Comment.find(hijo.son_id)
	sum += comentario.nota
	counter +=1
	end
	
	if counter>0
	aux = Comment.find(com.father_id)
	aux.grade2 = sum/counter
	aux.save
	end
	
	
        format.html { redirect_to Post.find(@comment.post_id), :notice => 'Comentario creado.' }
        format.json { render :json => @comm, :status => :created, :location => @comm }
      else
        format.html { render :action => "new" }
        format.json { render :json => @comm.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comms/1
  # PUT /comms/1.json
  def update
    @comm = Comm.find(params[:id])

    respond_to do |format|
      if @comm.update_attributes(params[:comm])
        format.html { redirect_to @comm, :notice => 'Comm was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @comm.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comms/1
  # DELETE /comms/1.json
  def destroy
    @comm = Comm.find(params[:id])
    @comm.destroy

    respond_to do |format|
      format.html { redirect_to comms_url }
      format.json { head :ok }
    end
  end
end
