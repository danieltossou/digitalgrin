class ImagesController < ApplicationController
    respond_to :json
  
    def create
      image_params[:image].open if image_params[:image].tempfile.closed?
  
      @image = Image.new(image_params)
  
      respond_to do |format|
        if @image.save
          format.json { render json: { url: @image.image_url }, status: :ok }
        else
          format.json { render json: @image.errors, status: :unprocessable_entity }
        end
      end
    end
  
    private
  
    def image_params
      params.require(:image).permit(:image)
    end
  end

  (function() {
    var host, uploadAttachment;
  
    document.addEventListener("trix-attachment-add", function(event) {
      var attachment;
      attachment = event.attachment;
      if (attachment.file) {
        return uploadAttachment(attachment);
      }
    });
  
    host = "/images";
  
    uploadAttachment = function(attachment) {
      var file, form, xhr;
      file = attachment.file;
      form = new FormData;
      form.append("Content-Type", file.type);
      form.append("image[image]", file);
      xhr = new XMLHttpRequest;
      xhr.open("POST", host, true);
      xhr.upload.onprogress = function(event) {
        var progress;
        progress = event.loaded / event.total * 100;
        return attachment.setUploadProgress(progress);
      };
      xhr.onload = function() {
        var href, url;
          url = href = JSON.parse(this.responseText).url;
          return attachment.setAttributes({
            url: url,
            href: href
          });
      };
      return xhr.send(form);
    };
  
  
  }).call(this);