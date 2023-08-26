class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!, only: [:destroy]

  def destroy
  end
end
