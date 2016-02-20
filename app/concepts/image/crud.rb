class Image < ActiveRecord::Base
  include Paperdragon::Model
  processable :data

  class Create < Trailblazer::Operation
    include Model
    model Image, :create

    contract do

      extend Paperdragon::Model::Writer # book p180
      processable_writer :image
      property :image_meta_data

      property :file, virtual: true
      validates :file, presence: true

    end

    def process(params)
      validate(params[:image]) do |f|
        f.image!(f.file) do |v|
          v.process!(:original)
        end
        f.save
      end
    end

  end

  class Update < Create
    action :update
  end
end
