json.extract! invoice, :id, :vendor_id, :company_id, :number, :issued_at, :due_at, :term, :created_at, :updated_at
json.url invoice_url(invoice, format: :json)
