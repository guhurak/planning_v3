class HomeController < ApplicationController
  skip_before_action :is_admin
  skip_before_action :is_authorized

  def index
    @year_selected = params[:year]&.to_i || DateTime.now.year
    @month_selected = params[:month]&.to_i || DateTime.now.month

    @weeks = Week.all.includes(:days)
    @users = User.all

    @weeks_nbr = @weeks.count

    months = ["Janvier", "Février", "Mars", "Avril", "Mai", "Juin", "Juillet", "Août", "Septembre", "Octobre", "Novembre", "Décembre"]

    @days_past = 0

    # Modify base values with params, get the number of year past since 2018 and months past in this year ( year can't be lower than 2018 )
    @years_past = @year_selected - 2018
    @months_past = @month_selected - 1
    @month = months[@months_past]

    # get the number of days past in past years except this year
    @years_past.times do |x|
      year = @year_selected.to_i - (x + 1) - 1
      @days_past += Time.days_in_year(year)
    end

    # get the number of days past in past months of this year except this month
    @months_past.times do |month|
      @days_past += Time.days_in_month(month + 1, @year_selected)
    end

    # - 7 'cause rolling planning begin at january 8 2018
    @days_past -= 7

    # here we get the number of days pasts of the last week past before the beginning of month selected
    @days_more = @days_past % 7

    # so here we get the number of weeks pasts
    @weeks_past = (@days_past - @days_more) / 7

    # we get the number of weeks past of the last rolling before the beginning of month selected
    @weeks_more = @weeks_nbr > 0 ? @weeks_past % @weeks_nbr : @weeks_past

    # se we get the number of rolls pasts before the beginning of month selected
    @rolls_past = @weeks_nbr > 0 ? (@weeks_past - @weeks_more) / @weeks_nbr : @weeks_past - @weeks_more
  end
end
