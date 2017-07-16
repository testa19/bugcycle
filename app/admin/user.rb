ActiveAdmin.register User do
  menu priority: 3
  permit_params :email, :password, :password_confirmation

  index do
    selectable_column
    actions
    id_column
    column :email
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
  end

  filter :email
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  show do
    columns do
      attributes_table do
        row :email
        row :current_sign_in_at
        row :sign_in_count
        row :created_at
        row :updated_at
      end
    end
    columns do
      column do
        h3 "Commited to"
        table_for resource.bicycle do 
          column :name
        end
      end
      column label:"Liked" do
        link_to "Liked", admin_bicycles_path(q: { likes_user_id_eq: user.id })
      end
    end
    
    active_admin_comments
  end

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :password
      f.input :password_confirmation
    end
    f.actions
  end

end
