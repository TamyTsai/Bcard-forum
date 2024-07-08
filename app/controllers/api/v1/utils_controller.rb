class Api::V1::UtilsController < Api::V1::BaseController

    IMAGE_EXT = [".git", ".jpeg", ".jpg", ".png", ".svg"]
    # 允許副檔名清單陣列

    def upload_image

        f = params[:file]
        # Parameters: {"file"=>#<ActionDispatch::Http::UploadedFile:0x000000013caa4370 @tempfile=#Tempfile:/var/folders/t2/yfl37_dn0l5g1r0fhsrcx18m0000gp/T/RackMultipart20240708-36898-5aipj7.png, @content_type="image/png", @original_filename="電腦.png", @headers="Content-Disposition: form-data; name=\"file\"; filename=\"電腦.png\"\r\nContent-Type: image/png\r\n">}
        # 用前端傳過來的參數抓使用者上傳到編輯器的圖片檔

        ext = File.extname(f.original_filename)
        # 抓出 檔案副檔名

        raise '不允許的檔案類型' unless IMAGE_EXT.include?(ext) 
        # 如果上傳的檔案副檔名不在 允許副檔名清單陣列 內 就噴例外

        blob = ActiveStorage::Blob.create_and_upload!(
            io: f,
            filename: f.original_filename,
            content_type: f.content_type, 
            )

        render json: { link: url_for(blob) } # 要回傳 檔案路徑 給前端froala editor

    end

end