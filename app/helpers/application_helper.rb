module ApplicationHelper
    def gravatar_for user
        email_address = user.email.downcase
        hash = Digest::SHA256.hexdigest(email_address)
        gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=200"
        return image_tag(gravatar_url, alt: user.username , class:"rounded shadow mx-auto d-block mt-4")
      end
end
