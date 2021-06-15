ActiveAdmin.register User do
  active_admin_paranoia
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#

  controller do
    # before_action :set_user_restore

    def download
      @users = User.all
      respond_to do |format|
        format.pdf do
          render pdf: "Users",
                 viewport_size: '1280x1024',
                 encoding: 'UTF-8',
                 template: 'admin/users/show_pdf.html.slim', layout: 'pdf.html.slim'
        end
      end
    end
  end

  sidebar 'Project Details', only: %i[show] do
    ul do
      li link_to 'download pdf', admin_users_download_path(id: params[:id], format: 'pdf')
    end
  end

  sidebar 'import csv', only: %i[index] do
    link_to 'Upload CSV', action: 'upload_csv'
  end

  collection_action :upload_csv do
    render 'admin/csv/upload_csv'
  end

  collection_action :import_csv, method: :post do
    CsvDb.convert_save('user', params[:dump][:file])
    redirect_to action: :index, notice: 'CSV imported successfully!'
  end
  permit_params do
    permitted = [:permitted, :attributes]
    permitted << :other if params[:action] == 'create' && current_user.admin?
    permitted
  end
end
