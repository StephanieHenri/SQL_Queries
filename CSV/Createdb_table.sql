DROP database if exists clip;
CREATE database clip;
USE clip;
CREATE table Sessions (session_id varchar (200) primary key, 
						timestamp int,
                        activity_date int,
                        user_id int,
                        session_length_seconds int,
                        wallet_cash int,
                        wallet_coins int,
                        level int);
                        
CREATE table inapp_purchase (session_id varchar (200) primary key, 
							activity_date int,
							user_id int,
							product_id int,
							purchase_value decimal (10,2),
                            Foreign key (session_id) references Sessions (session_id));
                            
-- select * FROM Sessions;
-- select * FROM inapp_purchase;

