ActiveAdmin.register User do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end

  index do
    column :email
    column :created_at
    column :updated_at
    actions
  end

  show do |u|
    attributes_table do
      row :email
      row :created_at
      row :updated_at
    end
  end

  permit_params :email, :password, :password_confirmation
  filter :email

  form do |f|
    f.semantic_errors *f.object.errors.keys
    f.inputs "Details" do
      f.input :email
      f.input :password, required: false, placeholder: "leave blank if you do not wish to update password"
      f.input :password_confirmation
    end
    f.actions
  end

end
