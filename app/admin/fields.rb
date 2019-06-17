ActiveAdmin.register Field do
    permit_params :name, :etat

    scope :all
    scope :actived
    scope :desactived
    
    action_item :actived, only: :show do
        link_to "Activer", actived_admin_field_path(field), method: :put if !field.etat?
    end

    action_item :desactived, only: :show do
        link_to "Desactiver", desactived_admin_field_path(field), method: :put if field.etat?
    end

    member_action :actived, method: :put do
        field = Field.find(params[:id])
        field.update(etat: true)
        redirect_to admin_field_path(field)
    end

    member_action :desactived, method: :put do
        field = Field.find(params[:id])
        field.update(etat: false)
        redirect_to admin_field_path(field)
    end

end
