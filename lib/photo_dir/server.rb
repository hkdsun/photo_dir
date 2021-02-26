require 'sinatra'

module PhotoDir
  class Server < Sinatra::Base
    set :photo_dir, Proc.new { ENV['PHOTO_DIR'] || "./example_dir" }
    set :public_folder, Proc.new { settings.photo_dir }
    set :bind, "0.0.0.0"

    get '/' do
      photo_dir = settings.photo_dir
      img_files = Dir.entries(photo_dir)
      img_files = img_files.select { |f| f.end_with?(".jpg") || f.end_with?(".png") }
      img_files = img_files.sort_by { |f| File.mtime("#{photo_dir}/#{f}") }.reverse
      erb :page, locals: { imgs: img_files }
    end
  end
end
