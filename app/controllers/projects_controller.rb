class ProjectsController < ApplicationController
  before_action :set_project, only: %i[show]
  before_action :more_projexcts, only: %i[index]

  def index    
    @projects = Project.find_status(params[:f_status]).order(id: :asc).first(session[:count_projects])
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def project_params
    # params.require(:project).permit(:photo, :preview_photo, :old_photo, :new_photo,
    #                                 :type, :status, :individual_type, :individual_type_en,
    #                                 :name, :name_en, :slug, :title, :title_en,
    #                                 :short_description, :short_description_en, :description,
    #                                 :description_en, :site, :url_facebook, :need_amount)
    params.require(:project).permit(:f_status, :count_projects)
  end
  
  def more_projexcts
    if params[:count_projects].blank?
      session[:count_projects] = 5
    else
      session[:count_projects] = session[:count_projects].to_i + params[:count_projects].to_i
    end
  end
end
