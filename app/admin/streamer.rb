ActiveAdmin.register Streamer do

  permit_params :name, :user_id, :twitch_username

  # Index
  index do
    column :name
    # column :subscription do |user|
    #   link_to user.subscription.slug, admin_subscription_path(user.subscription)
    # end
    actions
  end

  # Form
  form do |f|

    inputs 'Streamer' do
      f.input :name
      f.input :slug
      t.input :twitch_username
      f.input :user_id
    end

    f.actions
  end


end