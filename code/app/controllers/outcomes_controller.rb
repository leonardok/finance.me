# finances.me is a personal finance manager
# Copyright (C) 2010 Leonardo Korndörfer
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

class OutcomesController < ApplicationController
  # GET /outcomes
  # GET /outcomes.xml
  def index
    @outcomes = Outcome.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @outcomes }
    end
  end


  def update_subcategories
    @category_id = params['category_id']
    @to_model = "outcome"
    
    render :update do |page|
      page.replace_html "subcategory", :partial => 'subcategory_select', 
        :locals => { :category_id => @category_id, :to_model => @to_model }
        
    end
  end

  # GET /outcomes/1
  # GET /outcomes/1.xml
  def show
    @outcome = Outcome.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @outcome }
    end
  end

  # GET /outcomes/new
  # GET /outcomes/new.xml
  def new
    @outcome = Outcome.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @outcome }
    end
  end

  # GET /outcomes/1/edit
  def edit
    @outcome = Outcome.find(params[:id])
  end

  # POST /outcomes
  # POST /outcomes.xml
  def create
    @outcome = Outcome.new(params[:outcome])

    respond_to do |format|
      if @outcome.save
        flash[:notice] = 'Outcome was successfully created.'
        format.html { redirect_to(@outcome) }
        format.xml  { render :xml => @outcome, :status => :created, :location => @outcome }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @outcome.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /outcomes/1
  # PUT /outcomes/1.xml
  def update
    @outcome = Outcome.find(params[:id])

    respond_to do |format|
      if @outcome.update_attributes(params[:outcome])
        flash[:notice] = 'Outcome was successfully updated.'
        format.html { redirect_to(@outcome) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @outcome.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /outcomes/1
  # DELETE /outcomes/1.xml
  def destroy
    @outcome = Outcome.find(params[:id])
    @outcome.destroy

    respond_to do |format|
      format.html { redirect_to(outcomes_url) }
      format.xml  { head :ok }
    end
  end
end
