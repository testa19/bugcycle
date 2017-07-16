ActiveAdmin.register Bicycle do

  permit_params(:name, :description, :category_id,
    pic_attributes: [:id, :name, :image, :bicycle_id, :remote_image_url])

  action_item :new, only: :show do
    link_to 'New bike', new_admin_bicycle_path
  end

  action_item :show, only: [:edit, :show] do
    link_to 'Show bike page', bicycle_path(bicycle)
  end

  index do
    selectable_column #batch actions checkboxes column
    actions
    column :id
    column "Name", :name
    column "Description", :description
    column "Category", :category
    column "Updated at", :updated_at
    column "Created at", :created_at
  end
  
  show do
    attributes_table do
      row ("Name") { bicycle.name }
      row ("Description") { bicycle.description }
      row ("Category") { bicycle.category.name }
      row ("Created at") { bicycle.created_at }
      row ("Updated at") { bicycle.updated_at }
      row :pic do
        image_tag bicycle.pic.image.url if bicycle.pic
      end
    end
    active_admin_comments
  end

  form do |f|
    f.inputs 'Details' do
      f.input :name, label: 'Name'
      f.input :description, label: 'Description', input_html: { rows: 5 }
      f.input :category
    end
    
    f.inputs "Image", for: [:pic, f.object.pic || Pic.new] do |s|
      s.input :image, label: 'Image', as: :file,
        hint:  s.object.image.blank? ? content_tag(:p, "") : image_tag(s.object.image.url)
      s.input :image_cache, as: :hidden 
      s.input :remote_image_url, label: "or paste image link"
      # s.actions
    end
    
    f.actions
  end

# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
