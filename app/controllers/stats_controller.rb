class StatsController < ApplicationController
  def stats
    @numbers = params.fetch("list_of_numbers").gsub(",", "").split.map(&:to_f)

    # ================================================================================
    # Your code goes below.
    # The numbers the user input are in the array @numbers.
    # ================================================================================

    @sorted_numbers = @numbers.sort

    @count = @numbers.count

    @minimum = @numbers.min

    @maximum = @numbers.max

    @range = @maximum-@minimum

    # Median
    @median = 0
    
    if @sorted_numbers.length.odd?
    @median = @sorted_numbers[@sorted_numbers.length/2] 
    else
    @median=(@sorted_numbers[@sorted_numbers.length/2-1]+@sorted_numbers[@sorted_numbers.length/2])/2.to_f
    end
    
    # ======

    @sum = @sorted_numbers.sum

    @mean = @sum/@sorted_numbers.length

    # Variance
    
    @squaresum = 0
    
    @numbers.each do |number|
      @squaresum+= (@mean-number)**2
    end
    @variance= @squaresum/@numbers.length
  
    # ========

    @standard_deviation = Math.sqrt(@variance)

    # Mode
    
    
    
    # ====
    @mode= @sorted_numbers[0]
  
    @sorted_numbers.each do |number|
    if @sorted_numbers.count(number) > @sorted_numbers.count(@mode)
    @mode=number 
    end
  end
    
    # ================================================================================
    # Your code goes above.
    # ================================================================================

    render("stats_templates/stats.html.erb")
  end

  def stats_form
    render("stats_templates/stats_form.html.erb")
  end
  
end
