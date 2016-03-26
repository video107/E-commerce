ActiveAdmin.register Order do
  menu :priority => 3
  actions :index, :show

  filter :total_price
  filter :checked_out_at

  scope :all, :default => true
  scope :initial
  scope :completed

  index do
    column("Order", :sortable => :id) {|order| link_to "##{order.id} ", admin_order_path(order) }
    column("Status")                   {|order| status_tag(order.status) }
    column("order_name")
    column("order_phone")
    column("order_address")
    column("order_email")
    column("gold_count")
    column("silver_count")
    column("rose_count")
    column("Date", :updated_at)
    column("Name", :order_name, :sortable => :user_id)
    column("Total")                   {|order| number_to_currency order.total_amount }
  end

  show do
    # panel "Invoice" do
    #   table_for(order.line_items) do |t|
    #     t.column("Product") {|item| auto_link item.product        }
    #     t.column("Price")   {|item| number_to_currency item.price }
    #     tr :class => "odd" do
    #       td "Total:", :style => "text-align: right;"
    #       td number_to_currency(order.total_amount)
    #     end
    #   end
    # end
  end

  sidebar :customer_information, :only => :show do
    # attributes_table_for order.user do
    #   row("User") { auto_link order.user }
    #   row :email
    # end
  end

  sidebar "Active Admin Demo" do
    # render('/admin/sidebar_links', :model => 'orders')
  end
end
