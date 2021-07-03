# frozen_string_literal: true

class HomeController < ApplicationController
  def index;
    @projects = Project.find_status(params[:f_status])
  end
end
