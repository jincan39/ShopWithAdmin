module ApplicationHelper
  def auth_link
    if logged_in
      link_to "登出", logout_path, class: "black-text"
    else
      link_to "登陆", login_path, class: "black-text"
    end
  end
end
