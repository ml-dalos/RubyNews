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
  provider :instagram,
          '902078035f8a4ecfbaa12185c2efe2b1',
           '86a98a83797443e2bcc821edcaf819ba',
           scope: 'basic'

end