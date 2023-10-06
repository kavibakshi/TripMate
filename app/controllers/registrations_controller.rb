class RegistrationsController < ApplicationController
    def new
        @user = User.new