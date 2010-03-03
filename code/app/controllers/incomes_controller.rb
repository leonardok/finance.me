class IncomesController < ApplicationController
  # GET /incomes
  # GET /incomes.xml
  def index
    @incomes = Income.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @incomes }
    end
  end

  # GET /incomes/1
  # GET /incomes/1.xml
  def show
    @income = Income.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @income }
    end
  end

  # GET /incomes/new
  # GET /incomes/new.xml
  def new
    @income = Income.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @income }
    end
  end

  # GET /incomes/1/edit
  def edit
    @income = Income.find(params[:id])
  end

  # POST /incomes
  # POST /incomes.xml
  def create
    @income = Income.new(params[:income])
	@income.date = params[:income][:date]+"-01"

    respond_to do |format|
      if @income.save
        flash[:notice] = 'Income was successfully created.'
        format.html { redirect_to(@income) }
        format.xml  { render :xml => @income, :status => :created, :location => @income }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @income.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /incomes/1
  # PUT /incomes/1.xml
  def update
    @income = Income.find(params[:id])

    respond_to do |format|
      if @income.update_attributes(params[:income])
        flash[:notice] = 'Income was successfully updated.'
        format.html { redirect_to(@income) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @income.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /incomes/1
  # DELETE /incomes/1.xml
  def destroy
    @income = Income.find(params[:id])
    @income.destroy

    respond_to do |format|
      format.html { redirect_to(incomes_url) }
      format.xml  { head :ok }
    end
  end
end
