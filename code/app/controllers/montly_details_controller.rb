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
        date_now = Time.now.strftime('%Y%m')

    @outcomes = Outcome.find :all, :joins => [:subcategory, :company], :order => "data_vencimento", 
		:conditions => "strftime('%Y%m', outcomes.data_vencimento) = strftime('%Y%m', 'now') or 
		               (outcomes.data_pagamento is null and strftime('%Y%m', outcomes.data_vencimento) <= strftime('%Y%m', 'now'))
		               or (strftime('%Y%m',outcomes.data_pagamento) = strftime('%Y%m', 'now'))"

    @incomes = Income.find(:all)
    @totals  = Income.find_by_sql "
			SELECT year_month_incomes AS year_month,
             income_total,
             outcome_total,
             outcome_plannings_total
      FROM   (SELECT Sum(VALUE)                    AS income_total,
                     Strftime('%Y%m',incomes.DATE) AS year_month_incomes
              FROM   incomes
              WHERE  Strftime('%Y%m',incomes.DATE) = Strftime('%Y%m','now'))
             LEFT JOIN (SELECT Sum(VALUE)                               AS outcome_total,
                               Strftime('%Y%m',outcomes.data_pagamento) AS year_month_outcomes
                        FROM   outcomes
                        WHERE  Strftime('%Y%m',outcomes.data_pagamento) = Strftime('%Y%m','now'))
               ON year_month_outcomes = year_month_incomes
             LEFT JOIN (SELECT Sum(VALUE)                                       AS outcome_plannings_total,
                               Strftime('%Y%m',outcome_plannings.plan_for_date) AS year_month_outcome_plannings
                        FROM   outcome_plannings
                        WHERE  Strftime('%Y%m',outcome_plannings.plan_for_date) = Strftime('%Y%m','now'))
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
							  WHERE    Strftime('%Y%m',outcomes.data_pagamento) = Strftime('%Y%m','now')
							  GROUP BY categories.id)
					 ON outcome_categories = categories.id
				   LEFT JOIN (SELECT   Sum(outcome_plannings.VALUE) AS outcome_plannings_value,
									   categories.id                AS outcome_plannings_categories
							  FROM     outcome_plannings
									   LEFT JOIN subcategories
										 ON outcome_plannings.subcategory_id = subcategories.id
									   LEFT JOIN categories
										 ON subcategories.category_id = categories.id
							  WHERE    Strftime('%Y%m',outcome_plannings.plan_for_date) = Strftime('%Y%m','now')
							  GROUP BY categories.id)
					 ON outcome_plannings_categories = categories.id
			WHERE  outcomes_value IS NOT NULL
					OR outcome_plannings_value IS NOT NULL "
                    
    @date_today = Time.now.strftime('%Y%m%d').to_i
  end

  # GET /montly_details/1
  # GET /montly_details/1.xml
  def show
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
