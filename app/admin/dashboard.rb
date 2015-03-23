ActiveAdmin.register_page "Dashboard" do

    menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

    content title: proc{ I18n.t("active_admin.dashboard") } do
        columns do
            column do
                panel "Admin" do
                    li link_to "Products", admin_products_path
                    li link_to "Customers", admin_customers_path
                    li link_to "Salesmen", admin_salesmen_path
                    li link_to "Suppliers", admin_suppliers_path
                end
            end
            column do
                panel "Transactions" do
                    li link_to "Direct Purchases", admin_direct_purchases_path
                end
            end
        end
    end
end