ActiveAdmin.register User do
    permit_params :email, :username, :password, :password_confirmation
  
    index do
      selectable_column
      id_column
      column :email
      column :username
      actions
    end
  
    filter :email
    filter :username
  
    form do |f|
      f.inputs "User Details" do
        f.input :email
        f.input :username
        f.input :password
        f.input :password_confirmation
      end
      f.actions
    end
  end