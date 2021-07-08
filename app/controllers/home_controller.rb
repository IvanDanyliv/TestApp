# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :more_projexcts, only: %i[index]

  def index
    @projects = Project.find_status(params[:f_status]).order(id: :asc).first(session[:count_projects])
  end

  private

  def more_projexcts
    if params[:count_projects].blank?
      session[:count_projects] = 5
    else
      session[:count_projects] = session[:count_projects].to_i + params[:count_projects].to_i
    end
  end
end
