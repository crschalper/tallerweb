class CursosController < ApplicationController
	 before_filter :authenticate_user!
	 helper_method :sort_column, :sort_direction

  # GET /cursos
  # GET /cursos.json
  def index
    @cursos = Curso.order(sort_column + " " + sort_direction).paginate(:page => params[:page], :per_page => 10)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @cursos }
    end
  end

  # GET /cursos/1
  # GET /cursos/1.json
  def show
    @curso = Curso.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @curso }
    end
  end

  # GET /cursos/new
  # GET /cursos/new.json
  def new
    @curso = Curso.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @curso }
    end
  end

  # GET /cursos/1/edit
  def edit
    @curso = Curso.find(params[:id])
  end

  # POST /cursos
  # POST /cursos.json
  def create
    @curso = Curso.new(params[:curso])
    respond_to do |format|
      if @curso.save
    profesor = User.find(@curso.user_id)
    profesor.curso_id = @curso.id
    profesor.save
        format.html { redirect_to @curso, :notice => 'Curso creado satisfactoriamente.' }
        format.json { render :json => @curso, :status => :created, :location => @curso }
      else
        format.html { render :action => "new" }
        format.json { render :json => @curso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /cursos/1
  # PUT /cursos/1.json
  def update
    @curso = Curso.find(params[:id])

    respond_to do |format|
      if @curso.update_attributes(params[:curso])
        format.html { redirect_to @curso, :notice => 'Curso actualizado.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @curso.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /cursos/1
  # DELETE /cursos/1.json
  def destroy
    @curso = Curso.find(params[:id])
    @curso.destroy

    respond_to do |format|
      format.html { redirect_to cursos_url }
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
