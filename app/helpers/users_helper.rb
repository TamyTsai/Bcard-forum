module UsersHelper

    def avatar(user, size = 200)
        # image_tag user.avatar.variant(resize_to_fit: [size, size]), class: 'user-avatar' if user.avatar.attached?
        image_tag user.avatar.variant(resize_to_fill: [size, size]), class: 'avatar' if user.avatar.attached?
        # 將影像縮放至填滿指定尺寸，同時保留原始長寬比。必要時，將在較大的尺寸上裁剪影像。
    end

end