class HomeController < ApplicationController

    def index
        @menus = Menu.where(is_publish: true)
        @game_info = GameInfo.find_by(id: 1)
        @reviews = Review.limit(5).order('id desc')
    end
end
