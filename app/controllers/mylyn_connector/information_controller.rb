require File.dirname(__FILE__) + '/../../../lib/mylyn_connector'

class MylynConnector::InformationController < ApplicationController
  unloadable
  include MylynConnector::Rescue::ClassMethods

  skip_before_filter :verify_authenticity_token

  helper MylynConnector::MylynHelper
  
  def version
    @data = MylynConnector::Version.to_a

    respond_to do |format|
      format.xml {render :layout => false}
    end
  end

  def token
    render :text => form_authenticity_token
  end
end
