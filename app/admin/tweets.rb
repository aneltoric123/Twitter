ActiveAdmin.register Tweet do

  permit_params :content, :user_id

  index do
    selectable_column
    id_column
    
    column :content
    column :user
    actions
  end

  filter :content
  filter :user

  form do |f|
    f.inputs "Post Details" do    
      f.input :content
      f.input :user
    end
    f.actions
  end
end
