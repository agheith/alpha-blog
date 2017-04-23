class PagesController < ApplicationController

    def home
        redirect_to articles_path if logged_in? # the root path for logged_in users is the articles path
    end

    def about
    end

end
