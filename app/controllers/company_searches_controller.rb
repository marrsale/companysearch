class CompanySearchesController < ApplicationController
  def new; end

  def create
    # regularize query as GET param, allowing for user to hit back and for pagination
    redirect_to company_search_path q: params[:company_search][:company_name]
  end

  def show
    @company_search = CompaniesSearch.new params[:q], params[:offset]

    @last_offset = (params[:offset].to_i - @company_search.size) if params[:offset].present?
    @next_offset = (params[:offset].to_i or 0) + @company_search.size
  end
end
