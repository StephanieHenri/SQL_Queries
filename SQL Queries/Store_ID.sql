 SELECT 
		store_id,
		date,
		invoice_total,
		SUM(invoice_total) OVER (PARTITION BY date) as TotalSUM,
		invoice_total/SUM(invoice_total) OVER (PARTITION BY date) *100 as PctTotal
    FROM hauss.credit_score_invoices
    order by date, store_id
    -- order by store_id