ActiveAdmin.register User do

  permit_params role_ids: []

  # Index
  index do
    column :email
    # column :subscription do |user|
    #   link_to user.subscription.slug, admin_subscription_path(user.subscription)
    # end
    column :roles do |user|
      user.roles.collect {|c| c.name.capitalize }.to_sentence    
    end
    actions
  end

  # Form
  form do |f|

    inputs 'User' do
      f.input :email
      f.input :roles, as: :check_boxes
    end

    f.actions
  end


end