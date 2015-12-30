require 'json'
require 'optparse'
require "google_drive"
require "open-uri"
require 'google/api_client'
require 'oauth2'
require 'net/http'

module CredentialsHelper
  
  #account-1@starry-axis-110415.iam.gserviceaccount.com
  #notasecret
  
  #1qOlai7gA7mrWLngy-2d4Ee4hJxKrK4gOEVPH5100IJc
  #1xJX-PmuVBqzEao-N8JpzXhfXI_F3lYs9jYYJ7UF2LxY
  
  
  
#------------------------------ Google Sheet interaction -------------------------------------------------------------------  
  
  def write_geo_to_sheet(lat_list, lng_list)
    
    ws = @g_sheet
    
    lat_list.each_with_index do |lat, index|
      x_cell = 3
      y_cell = index + 1
      ws[y_cell, x_cell] = lat
    end
    
    lng_list.each_with_index do |lng, index|
      x_cell = 4
      y_cell = index + 1
      ws[y_cell, x_cell] = lng
    end
    
    ws.save
    
  end
  

  
  
  def get_ws_rows_content(ws)
    ws.rows
  end
  
  
#-------------------------------------------------------------------------------------------------

#------------------------------ Geo Tagger -------------------------------------------------------------------

  def geo_tag_addresses(addresses)
    
    lat_list = []
    lng_list = []
      
    #Accept address string
    #Get Json object
    
    addresses.each do |address|
      api_key = "AIzaSyCW6S4V0IgkgoXwsgZUtdTTNRzM2zPqe9E"
      uri = "https://maps.googleapis.com/maps/api/geocode/json?address=#{address}&key=#{api_key}"
      result = Net::HTTP.get(URI.parse(uri))
      result.instance_of? String
      
      #Parse out lat and long
      result_hash = JSON.parse(result)
      location_key = result_hash.values[0][0]
      lat = location_key["geometry"]["location"]["lat"]
      lng = location_key["geometry"]["location"]["lng"]
      
      lat_list.push(lat)
      lng_list.push(lng)
    end
    
    write_geo_to_sheet(lat_list, lng_list)
  end

#-------------------------------Google Drive Session -------------------------------------------- 

 def connect_to_google_docs(service_account_id, secret, ws_key)
    puts "Initialising client"
    api_client = Google::APIClient.new()
    drive = api_client.discovered_api('drive', 'v2')
  
    puts "Loading credentials"
    keypath = Rails.root.join('config','My Project-b720e7c55193.p12').to_s
    
    #key = Google::APIClient::PKCS12.load_key(keypath, secret)
    sa_key = Google::APIClient::KeyUtils.load_from_pkcs12(keypath, secret)
    asserter = Google::APIClient::JWTAsserter.new(
      service_account_id,
      "https://www.googleapis.com/auth/drive " +
      "https://spreadsheets.google.com/feeds/",
      sa_key
      )
  
    puts "Authorizing"
    api_client.authorization = asserter.authorize()
    api_response = api_client.authorization
    token = api_response.access_token
    g_session = GoogleDrive.login_with_oauth(token)
    
  end

#-------------------------------------------------------------------------------------------------  
  
#------------------------------Process Controllers -------------------------------------------------------------------
  
  def process_controller_A(service_account_id, secret, ws_key)
    id = service_account_id
    secret = secret
    key = ws_key
    puts "Recieved credentials: "
    puts "#{id} + #{secret} + #{key}"
    #This will be used to control the process
    #Establish Session
    puts "Establishing session"
    g_session = connect_to_google_docs(id, secret, key)
    #Get the Google Spreadsheet/WorkSheet
    puts "Getting Worksheet"
    @g_sheet = g_session.spreadsheet_by_key(ws_key).worksheets[0]
    #Get origional sheet content
    @orgional_sheet_content =  get_ws_rows_content(@g_sheet)
    
  end
  
  def process_controller_B(addresses)
    geo_tag_addresses(addresses)
    @new_sheet_content =  get_ws_rows_content(@g_sheet)
  end
  
#-------------------------------------------------------------------------------------------------  
  
end
