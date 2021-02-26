require 'sinatra'

module PhotoDir
  class Server < Sinatra::Base
    set :public_folder, ENV['PHOTO_DIR']
    set :env, 'production'
    set :bind, "0.0.0.0"

    get '/' do
      img_files = Dir.entries(ENV['PHOTO_DIR'])
      img_files = img_files.select { |f| f.end_with?(".jpg") || f.end_with?(".png") }
      img_files = img_files.sort_by { |f| File.mtime("#{ENV['PHOTO_DIR']}/#{f}") }.reverse
      erb :page, locals: { imgs: img_files }
    end
  end
end
