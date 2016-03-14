# require "active_merchant/billing/integrations/action_view_helper"
# ActionView::Base.send(:include, ActiveMerchant::Billing::Integrations::ActionViewHelper)

OffsitePayments::Integrations::Pay2go.setup do |pay2go|
  # You have to apply credential below by yourself.
  pay2go.merchant_id = '123456'
  pay2go.hash_key    = 'xxx'
  pay2go.hash_iv     = 'yyy'
end
