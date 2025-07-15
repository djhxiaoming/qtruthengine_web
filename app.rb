require 'sinatra'
require 'rqrcode'
require 'base64'

set :public_folder, File.dirname(__FILE__) + '/public'
set :erb, layout: :'layout'

helpers do
  def generate_qr(url)
    qr = RQRCode::QRCode.new(url)
    png = qr.as_png(size: 200)
    "data:image/png;base64,#{Base64.strict_encode64(png.to_s)}"
  end
end

get '/' do
  @app_store_url = 'https://apps.apple.com/app/idXXXXXXXXX'
  @play_store_url = 'https://play.google.com/store/apps/details?id=XXXXXXXXX'
  @apk_url = '/downloads/app.apk'
  @feature_images = [
    '/images/feature1.png',
    '/images/feature2.png',
    '/images/feature3.png'
  ]
  erb :index
end

get '/purchase' do
  @coins = [
    { amount: 100, price: '$0.99' },
    { amount: 500, price: '$3.99' },
    { amount: 1200, price: '$8.99' }
  ]
  @memberships = [
    { name: 'Silver', price: '$2.99/month' },
    { name: 'Gold', price: '$5.99/month' },
    { name: 'Platinum', price: '$9.99/month' }
  ]
  erb :purchase
end 