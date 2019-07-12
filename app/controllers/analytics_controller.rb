class AnalyticsController < ApplicationController

    def index
        render "/analytics/index"
    end

    def show
        render "/analytics/show"
    end

end