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

class MontlyDetailsController < ApplicationController
  # GET /montly_details
  # GET /montly_details.xml
  def index
    @year = Outcome.find_by_sql("SELECT STRFTIME('%Y',data_vencimento) as year
      FROM outcomes
      group by year
      UNION
      SELECT STRFTIME('%Y',plan_for_date) as year
      FROM outcome_plannings
      group by year")
      
    @month = Outcome.find_by_sql("SELECT STRFTIME('%m',data_vencimento) as month
      FROM outcomes
      group by month
      UNION
      SELECT STRFTIME('%m',plan_for_date) as month
      FROM outcome_plannings
      group by month")
      
    
  end


  # GET /montly_details/1
  # GET /montly_details/1.xml
  def show    
    logger.debug "Imprimindo ano: #{params[:year]}"
    logger.debug "Imprimindo mes: #{params[:month]}"
    
    logger.debug "Imprimindo ano cookie: #{cookies[:year]}"
    logger.debug "Imprimindo mes cookie: #{cookies[:month]}"
    
    
    if (params[:year] == nil and cookies[:year] == nil)
      cookies[:year] = Time.now.strftime('%Y')
    end
    
    if (params[:month] == nil and cookies[:month] == nil)
      cookies[:month] = Time.now.strftime('%m')
    end
    
    year  = (params[:year] != nil)  ? params[:year] : cookies[:year]
    month = (params[:month] != nil) ? params[:month] : cookies[:month]
    
    cookies[:year]  = year
    cookies[:month] = month
    
    @outcomes = Outcome.find :all, :joins => [:subcategory, :company], :order => "data_vencimento", 
		:conditions => "strftime('%Y%m', outcomes.data_vencimento) = '#{year+month}' or 
		               (outcomes.data_pagamento is null and strftime('%Y%m', outcomes.data_vencimento) <= '#{year+month}')
		               or (strftime('%Y%m',outcomes.data_pagamento) = '#{year+month}')"

    @incomes = Income.find(:all, :conditions => "strftime('%Y%m',date) = '#{year+month}'")
    @totals  = Income.find_by_sql "
			SELECT year_month_incomes AS year_month,
             income_total,
             outcome_total,
             outcome_plannings_total
      FROM   (SELECT Sum(VALUE)                    AS income_total,
                     Strftime('%Y%m',incomes.DATE) AS year_month_incomes
              FROM   incomes
              WHERE  Strftime('%Y%m',incomes.DATE) = '#{year+month}')
             LEFT JOIN (SELECT Sum(VALUE)                               AS outcome_total,
                               Strftime('%Y%m',outcomes.data_pagamento) AS year_month_outcomes
                        FROM   outcomes
                        WHERE  Strftime('%Y%m',outcomes.data_pagamento) = '#{year+month}')
               ON year_month_outcomes = year_month_incomes
             LEFT JOIN (SELECT Sum(VALUE)                                       AS outcome_plannings_total,
                               Strftime('%Y%m',outcome_plannings.plan_for_date) AS year_month_outcome_plannings
                        FROM   outcome_plannings
                        WHERE  Strftime('%Y%m',outcome_plannings.plan_for_date) = '#{year+month}')
               ON year_month_outcome_plannings = year_month_incomes "
    
    @category_outcomes = Outcome.find_by_sql "
			SELECT categories.label AS label,
				   outcomes_value,
				   outcome_plannings_value
			FROM   categories
				   LEFT JOIN (SELECT   Sum(outcomes.VALUE) AS outcomes_value,
									   categories.id       AS outcome_categories
							  FROM     outcomes
									   LEFT JOIN subcategories
										 ON outcomes.subcategory_id = subcategories.id
									   LEFT JOIN categories
										 ON subcategories.category_id = categories.id
							  WHERE    Strftime('%Y%m',outcomes.data_pagamento) = '#{year+month}'
							  GROUP BY categories.id)
					 ON outcome_categories = categories.id
				   LEFT JOIN (SELECT   Sum(outcome_plannings.VALUE) AS outcome_plannings_value,
									   categories.id                AS outcome_plannings_categories
							  FROM     outcome_plannings
									   LEFT JOIN subcategories
										 ON outcome_plannings.subcategory_id = subcategories.id
									   LEFT JOIN categories
										 ON subcategories.category_id = categories.id
							  WHERE    Strftime('%Y%m',outcome_plannings.plan_for_date) = '#{year+month}'
							  GROUP BY categories.id)
					 ON outcome_plannings_categories = categories.id
			WHERE  outcomes_value IS NOT NULL
					OR outcome_plannings_value IS NOT NULL "
                    
    @date_today = Time.now.strftime('%Y%m%d').to_i
    
  end

  # GET /montly_details/new
  # GET /montly_details/new.xml
  def new
    @montly_detail = MontlyDetail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @montly_detail }
    end
  end

  # GET /montly_details/1/edit
  def edit
    @montly_detail = MontlyDetail.find(params[:id])
  end

  # POST /montly_details
  # POST /montly_details.xml
  def create
    @montly_detail = MontlyDetail.new(params[:montly_detail])

    respond_to do |format|
      if @montly_detail.save
        flash[:notice] = 'MontlyDetail was successfully created.'
        format.html { redirect_to(@montly_detail) }
        format.xml  { render :xml => @montly_detail, :status => :created, :location => @montly_detail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @montly_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /montly_details/1
  # PUT /montly_details/1.xml
  def update
    @montly_detail = MontlyDetail.find(params[:id])

    respond_to do |format|
      if @montly_detail.update_attributes(params[:montly_detail])
        flash[:notice] = 'MontlyDetail was successfully updated.'
        format.html { redirect_to(@montly_detail) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @montly_detail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /montly_details/1
  # DELETE /montly_details/1.xml
  def destroy
    @montly_detail = MontlyDetail.find(params[:id])
    @montly_detail.destroy

    respond_to do |format|
      format.html { redirect_to(montly_details_url) }
      format.xml  { head :ok }
    end
  end
end
