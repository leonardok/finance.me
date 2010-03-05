class SubmenusController < ApplicationController
  # GET /submenus
  # GET /submenus.xml
  def index
    @submenus = Submenu.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @submenus }
    end
  end

  # GET /submenus/1
  # GET /submenus/1.xml
  def show
    @submenu = Submenu.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @submenu }
    end
  end

  # GET /submenus/new
  # GET /submenus/new.xml
  def new
    @submenu = Submenu.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @submenu }
    end
  end

  # GET /submenus/1/edit
  def edit
    @submenu = Submenu.find(params[:id])
  end

  # POST /submenus
  # POST /submenus.xml
  def create
    @submenu = Submenu.new(params[:submenu])

    respond_to do |format|
      if @submenu.save
        flash[:notice] = 'Submenu was successfully created.'
        format.html { redirect_to(@submenu) }
        format.xml  { render :xml => @submenu, :status => :created, :location => @submenu }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @submenu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /submenus/1
  # PUT /submenus/1.xml
  def update
    @submenu = Submenu.find(params[:id])

    respond_to do |format|
      if @submenu.update_attributes(params[:submenu])
        flash[:notice] = 'Submenu was successfully updated.'
        format.html { redirect_to(@submenu) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @submenu.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /submenus/1
  # DELETE /submenus/1.xml
  def destroy
    @submenu = Submenu.find(params[:id])
    @submenu.destroy

    respond_to do |format|
      format.html { redirect_to(submenus_url) }
      format.xml  { head :ok }
    end
  end
end
