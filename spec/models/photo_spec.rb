require 'spec_helper'

describe Photo do
  describe "self.image_from_url" do
    it "should download an external url and save it to image" do
      url = "http://www.example.com/image.jpeg"
      request = stub_request(:get, url)
        .to_return(:body => File.read("spec/factories/sample_image.jpeg"))

      photo = Photo.new
      photo.image_from_url(url)
      photo.image_file_name.should_not be_nil
      request.should have_been_requested
    end
  end
end
