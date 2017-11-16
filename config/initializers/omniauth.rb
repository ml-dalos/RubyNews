Rails.application.config.middleware.use OmniAuth::Builder do
  provider :twitter,
           'gRukpzks6S3Jz1IsUDUvoe3jV',
           'KsRtgs2qOLo3aw4ivzFaFYoaNe7SdDp1VoPK5mLVPrb6KetzOS'
  provider :vk,
           '6100837',
           'hWI4wrah15xaxNSofKho'
  provider :google_oauth2,
           '1009869426048-vv2pdmv9audnmspnkqi4smnqtd2dujki.apps.googleusercontent.com',
           'Wsiv3WeNnJjNKtoxjn7BUj6d',
           scope: 'profile',
           access_type: 'online',
           name: 'google'
end