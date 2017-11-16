Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter, 'gRukpzks6S3Jz1IsUDUvoe3jV', 'KsRtgs2qOLo3aw4ivzFaFYoaNe7SdDp1VoPK5mLVPrb6KetzOS'
  provider :facebook, '533022970367344', '48941cf54bb097af40004f2b4edc41f8', scope: 'public_profile'
  provider :vk, '6100837', 'hWI4wrah15xaxNSofKho'
  provider :google_oauth2, ' 1009869426048-vvm717483rb2muhdg6c5obnjo30f3po0.apps.googleusercontent.com ',
           ' tAxA2Mp2DlnNx44Tiq-5gaFE ', scope: 'profile', access_type: 'online',name: 'google'
end