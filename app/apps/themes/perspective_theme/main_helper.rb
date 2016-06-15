module Themes::PerspectiveTheme::MainHelper
  def self.included(klass)
    klass.helper_method [:perspective_social_networks] rescue "" # here your methods accessible from views
  end

  def perspective_theme_settings(theme)
    # callback to save custom values of fields added in my_theme/views/admin/settings.html.erb
  end

  # callback called after theme installed
  def perspective_theme_on_install_theme(theme)
    # if you want to sell or want to add one click install for your theme, please check "def perspective_theme_on_install_theme" here:
    # https://gist.github.com/owen2345/c3217f0e6e5567b332f8dabbfbe634a6
  end

  # callback executed after theme uninstalled
  def perspective_theme_on_uninstall_theme(theme)
    # theme.destroy # uncomment this if you want to delete all related content after switched another theme
  end

  # print social links
  def perspective_social_networks
    res = []
    if(fb = current_theme.the_field('social_fb')).present?
      res << "<li><a href='#{fb}' class='facebook'> </a></li>"
    end

    if(p = current_theme.the_field('social_pi')).present?
      res << "<li><a href='#{p}' class='p'> </a></li>"
    end

    if(g = current_theme.the_field('social_go')).present?
      res << "<li><a href='#{g}' class='g'> </a></li>"
    end

    if(t = current_theme.the_field('social_tw')).present?
      res << "<li><a href='#{t}' class='twitter'> </a></li>"
    end
    res.join(' ')
  end
end
