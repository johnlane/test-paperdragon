require 'test_helper'

class ImageCrudTest < MiniTest::Spec

  describe "Create" do
    it "persists valid" do

      # Currently fails with #<IOError: closed stream> when process! is called
      # but works in the main application.
      file = ActionDispatch::Http::UploadedFile.new({
        tempfile: File.new(Rails.root.join("test/fixtures/sample.jpg"))
      })
      image = Image::Create.(file: file).model
      image.persisted?.must_equal true

    end

  end
end
