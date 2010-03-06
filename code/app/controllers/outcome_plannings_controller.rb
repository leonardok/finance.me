# finances.me is a personal finance manager
# Copyright (C) 2010 Leonardo Korndõrfer
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

class OutcomePlanningsController < ApplicationController
  # GET /outcome_plannings
  # GET /outcome_plannings.xml
  def index
    @outcome_plannings = OutcomePlanning.all(:joins => :subcategory)
    
    @outcome_plan_all = OutcomePlanning.find_by_sql("
      SELECT SUM(value) as value, category_id, categories.label as category_label
      FROM outcome_plannings
      LEFT join subcategories ON subcategories.id = outcome_plannings.subcategory_id
      LEFT join categories ON categories.id = subcategories.category_id
      group by category_id
      ")

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @outcome_plannings }
    end
  end
  
  def update_subcategories
    @category_id = params['category_id']
    @to_model = "outcome_planning"
    
    render :update do |page|
      page.replace_html "subcategory", :partial => 'subcategory_select', 
        :locals => { :category_id => @category_id }
        
    end
  end

  # GET /outcome_plannings/1
  # GET /outcome_plannings/1.xml
  def show
    @outcome_planning = OutcomePlanning.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @outcome_planning }
    end
  end

  # GET /outcome_plannings/new
  # GET /outcome_plannings/new.xml
  def new
    @outcome_planning = OutcomePlanning.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @outcome_planning }
    end
  end

  # GET /outcome_plannings/1/edit
  def edit
    @outcome_planning = OutcomePlanning.find(params[:id])
  end

  # POST /outcome_plannings
  # POST /outcome_plannings.xml
  def create
    @outcome_planning = OutcomePlanning.new(params[:outcome_planning])
    @outcome_planning.plan_for_date = params[:outcome_planning][:plan_for_date]+"-01"

    respond_to do |format|
      if @outcome_planning.save
        flash[:notice] = 'OutcomePlanning was successfully created.'
        format.html { redirect_to(@outcome_planning) }
        format.xml  { render :xml => @outcome_planning, :status => :created, :location => @outcome_planning }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @outcome_planning.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /outcome_plannings/1
  # PUT /outcome_plannings/1.xml
  def update
    @outcome_planning = OutcomePlanning.find(params[:id])

    respond_to do |format|
      if @outcome_planning.update_attributes(params[:outcome_planning])
        flash[:notice] = 'OutcomePlanning was successfully updated.'
        format.html { redirect_to(@outcome_planning) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @outcome_planning.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /outcome_plannings/1
  # DELETE /outcome_plannings/1.xml
  def destroy
    @outcome_planning = OutcomePlanning.find(params[:id])
    @outcome_planning.destroy

    respond_to do |format|
      format.html { redirect_to(outcome_plannings_url) }
      format.xml  { head :ok }
    end
  end
end
