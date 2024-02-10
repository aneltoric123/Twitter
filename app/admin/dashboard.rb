ActiveAdmin.register_page "Dashboard" do
  menu priority: 1, label: proc { I18n.t("active_admin.dashboard") }

  content title: proc { I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    columns do
      column do
        panel "Recent Tweets" do
          ul do
            Tweet.all.map do |tweet|
              li link_to(tweet.content, admin_tweet_path(tweet))
            end
          end
        end
      end

      column do
        panel "Recent Users" do
          ul do
            User.all.map do |user|
              li link_to(user.username, admin_user_path(user))
            end
          end
        end
      end
    end
  end
end
