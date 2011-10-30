class ApplicationController < ActionController::Base

  helper_method :available_locales, :current_locale?, :current_page_path
  before_filter :set_locale

  protect_from_forgery

  def available_locales
   I18n.available_locales.map(&:to_s).sort
  end

  def current_locale?(l)
   l.to_sym == I18n.locale.to_sym
  end

  def current_page_path(options={})
   url_for( {:controller => self.controller_name, :action => self.action_name}.merge(options) )
  end

  def set_locale
   I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options(options={})
   logger.debug "default_url_options is passed options: #{options.inspect}\n"
   { :locale => I18n.locale }
  end
end
