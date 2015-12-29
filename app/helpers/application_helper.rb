module ApplicationHelper
  
  def get_season()
    time = Time.new
    
    if(time.month >=3 && time.month <= 5)
      "Current Season: Spring"
    elseif(time.month >5 && time.month <= 8)
      "Current Season: Summer"
    elseif(time.month >8 && time.month <= 10)
      "Current Season: Autumn"
    else
      "Current season: Winter"
    end
  end
  
   def get_message()
      "Hello from Get Message"
   end
  
end
