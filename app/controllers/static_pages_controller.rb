class StaticPagesController < ApplicationController
  before_action :require_user!, except: [:welcome]
end
