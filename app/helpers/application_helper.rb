module ApplicationHelper
  # http://kakas-blog.logdown.com/posts/286448-rails101-chapter3-notice-message
    def notice_message
      # 第一個部分是關閉的按鈕 x
      alert_types = {notice: :success, alert: :danger}
      close_button_options = {class: "close", "data-dissmiss" => "alert", "aria-hidden" => true}

      # 以下等同於<button class="close" data-dismiss="alert" aria-hidden="true">x</button>
      close_button = content_tag(:button, "x", close_button_options)

      # 第二個部分是警告訊息
      # flash[:alert] = "該睡覺囉！"
      # type = :alert, message = "該睡覺囉！"
      alerts = flash.map do |type, message|

        # <button class="close" data-dismiss="alert" aria-hidden="true">x</button>該睡覺囉
        alert_content = close_button + message

        # alert_type = :danger
        alert_type = alert_types[type.to_sym] || type
        alert_class = "alert alert-#{alert_type} alert-dismaissable"

        # 透過content_tag，alerts就變成:
        # <div class="alert alert-danger alert-dismissable">
        # <button class="close" data-dismiss="alert" aria-hidden="true">x</button>該睡覺囉
        # </div>
        content_tag(:div, alert_content, class: alert_class)
      end
      # 將alerts物件轉換成html
      alerts.join("\n").html_safe
    end
end
