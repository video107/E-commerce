# require "active_merchant/billing/integrations/action_view_helper"
# ActionView::Base.send(:include, ActiveMerchant::Billing::Integrations::ActionViewHelper)

OffsitePayments::Integrations::Pay2go.setup do |pay2go|
  # You have to apply credential below by yourself.
  pay2go.merchant_id = Settings.pay2go_merchant_id
  pay2go.hash_key    = Settings.pay2go_hash_key
  pay2go.hash_iv     = Settings.pay2go_hash_iv
end
