Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, '543493445715398', 'f0185040a11cc6b4415b84024d37e8bb'
end