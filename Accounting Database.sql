USE H_Accounting;

DROP PROCEDURE IF EXISTS `team7msba2_calculate_financial_statement_sp`;
-- The typycal delimiter for Stored procedures is a double dollar sign
DELIMITER $$

CREATE PROCEDURE `team7msba2_calculate_financial_statement_sp`(varCalendarYear YEAR)
	BEGIN
  
  	-- We receive as an argument the year for which we will calculate the revenues
    -- This value is stored as an 'YEAR' type in the variable `varCalendarYear`
    -- To avoid confusion among which are fields from a table vs. which are the variables
    -- A good practice is to adopt a naming convention for all variables
    -- In these lines of code we are naming prefixing every variable as "var"
    -- We can define variables inside of our procedure
	
		-- Declare Income Statement variables
		DECLARE varTotalRevenue DOUBLE DEFAULT 0;
        DECLARE varReturnRefund DOUBLE DEFAULT 0;
        DECLARE varCOGS DOUBLE DEFAULT 0;
        DECLARE varAdministrativeExpenses DOUBLE DEFAULT 0;
        DECLARE varSellingExpenses DOUBLE DEFAULT 0;
        DECLARE varOtherExpenses DOUBLE DEFAULT 0;
        DECLARE varOtherIncome DOUBLE DEFAULT 0;
        DECLARE varIncomeTax DOUBLE DEFAULT 0;
        DECLARE varOtherTax DOUBLE DEFAULT 0;
        
        -- Declare Balance Sheet variables      
        DECLARE varCurrentAssets DOUBLE DEFAULT 0;
		DECLARE varFixedAssets DOUBLE DEFAULT 0;
        DECLARE varDeferredAssets DOUBLE DEFAULT 0;
        DECLARE varCurrentLiabilities DOUBLE DEFAULT 0;
        DECLARE varLongtermLiabilities DOUBLE DEFAULT 0;
        DECLARE varDeferredLiabilities DOUBLE DEFAULT 0;   
        DECLARE varEquity DOUBLE DEFAULT 0;

		-- Retrieve Total Revenue for Income Statement
        SELECT IFNULL(SUM(jeli.credit), 0) INTO varTotalRevenue
			FROM journal_entry_line_item    AS jeli		
			INNER JOIN account 				AS ac ON ac.account_id = jeli.account_id
			INNER JOIN journal_entry		AS je ON je.journal_entry_id = jeli.journal_entry_id
			INNER JOIN statement_section	AS ss ON ss.statement_section_id = ac.profit_loss_section_id      
			WHERE ss.statement_section_code = "REV"
				AND je.debit_credit_balanced = 1
                AND je.cancelled = 0
				AND YEAR(je.entry_date) = varCalendarYear;

		-- Retrieve Total Returns, Refunds, Discounts for Income Statement
        SELECT IFNULL(SUM(jeli.debit), 0) INTO varReturnRefund
			FROM journal_entry_line_item    AS jeli		
			INNER JOIN account 				AS ac ON ac.account_id = jeli.account_id
			INNER JOIN journal_entry		AS je ON je.journal_entry_id = jeli.journal_entry_id
			INNER JOIN statement_section	AS ss ON ss.statement_section_id = ac.profit_loss_section_id      
			WHERE ss.statement_section_code = "RET"
				AND je.debit_credit_balanced = 1
                AND je.cancelled = 0
				AND YEAR(je.entry_date) = varCalendarYear;

		-- Retrieve Total Cost of Goods and Service for Income Statement
        SELECT IFNULL(SUM(jeli.debit), 0) INTO varCOGS
			FROM journal_entry_line_item    AS jeli		
			INNER JOIN account 				AS ac ON ac.account_id = jeli.account_id
			INNER JOIN journal_entry		AS je ON je.journal_entry_id = jeli.journal_entry_id
			INNER JOIN statement_section	AS ss ON ss.statement_section_id = ac.profit_loss_section_id      
			WHERE ss.statement_section_code = "COGS"
				AND je.debit_credit_balanced = 1
                AND je.cancelled = 0
				AND YEAR(je.entry_date) = varCalendarYear;

		-- Retrieve Total Administrative Expenses for Income Statement
        SELECT IFNULL(SUM(jeli.debit), 0) INTO varAdministrativeExpenses
			FROM journal_entry_line_item    AS jeli		
			INNER JOIN account 				AS ac ON ac.account_id = jeli.account_id
			INNER JOIN journal_entry		AS je ON je.journal_entry_id = jeli.journal_entry_id
			INNER JOIN statement_section	AS ss ON ss.statement_section_id = ac.profit_loss_section_id      
			WHERE ss.statement_section_code = "GEXP"
				AND je.debit_credit_balanced = 1
                AND je.cancelled = 0
				AND YEAR(je.entry_date) = varCalendarYear;

		-- Retrieve Total Selling Expenses for Income Statement
        SELECT IFNULL(SUM(jeli.debit), 0) INTO varSellingExpenses
			FROM journal_entry_line_item    AS jeli		
			INNER JOIN account 				AS ac ON ac.account_id = jeli.account_id
			INNER JOIN journal_entry		AS je ON je.journal_entry_id = jeli.journal_entry_id
			INNER JOIN statement_section	AS ss ON ss.statement_section_id = ac.profit_loss_section_id      
			WHERE ss.statement_section_code = "SEXP"
				AND je.debit_credit_balanced = 1
                AND je.cancelled = 0
				AND YEAR(je.entry_date) = varCalendarYear;

		-- Retrieve Other Expenses for Income Statement 
        SELECT IFNULL(SUM(jeli.debit), 0) INTO varOtherExpenses
			FROM journal_entry_line_item    AS jeli		
			INNER JOIN account 				AS ac ON ac.account_id = jeli.account_id
			INNER JOIN journal_entry		AS je ON je.journal_entry_id = jeli.journal_entry_id
			INNER JOIN statement_section	AS ss ON ss.statement_section_id = ac.profit_loss_section_id      
			WHERE ss.statement_section_code = "OEXP"
				AND je.debit_credit_balanced = 1
                AND je.cancelled = 0
				AND YEAR(je.entry_date) = varCalendarYear;

		-- Retrieve Other Income for Income Statement
        SELECT IFNULL(SUM(jeli.credit), 0) INTO varOtherIncome
			FROM journal_entry_line_item    AS jeli		
			INNER JOIN account 				AS ac ON ac.account_id = jeli.account_id
			INNER JOIN journal_entry		AS je ON je.journal_entry_id = jeli.journal_entry_id
			INNER JOIN statement_section	AS ss ON ss.statement_section_id = ac.profit_loss_section_id      
			WHERE ss.statement_section_code = "OI"
				AND je.debit_credit_balanced = 1
                AND je.cancelled = 0
				AND YEAR(je.entry_date) = varCalendarYear;
                
		-- Retrieve Income Tax for Income Statement
        SELECT IFNULL(SUM(jeli.debit), 0) INTO varIncomeTax
			FROM journal_entry_line_item    AS jeli		
			INNER JOIN account 				AS ac ON ac.account_id = jeli.account_id
			INNER JOIN journal_entry		AS je ON je.journal_entry_id = jeli.journal_entry_id
			INNER JOIN statement_section	AS ss ON ss.statement_section_id = ac.profit_loss_section_id      
			WHERE ss.statement_section_code = "INCTAX"
				AND je.debit_credit_balanced = 1
                AND je.cancelled = 0
				AND YEAR(je.entry_date) = varCalendarYear;

		-- Retrieve Other Tax for Income Statement
        SELECT IFNULL(SUM(jeli.debit), 0) INTO varOtherTax
			FROM journal_entry_line_item    AS jeli
			INNER JOIN account 				AS ac ON ac.account_id = jeli.account_id
			INNER JOIN journal_entry		AS je ON je.journal_entry_id = jeli.journal_entry_id
			INNER JOIN statement_section	AS ss ON ss.statement_section_id = ac.profit_loss_section_id      
			WHERE ss.statement_section_code = "OTHTAX"
				AND je.debit_credit_balanced = 1
                AND je.cancelled = 0
				AND YEAR(je.entry_date) = varCalendarYear;

		## Retrieve Net Current Assets for Balance Sheet
        SELECT IFNULL(SUM(jeli.debit), 0) - IFNULL(SUM(jeli.credit), 0) INTO varCurrentAssets
			FROM journal_entry_line_item    AS jeli		
			INNER JOIN account 				AS ac ON ac.account_id = jeli.account_id
			INNER JOIN journal_entry		AS je ON je.journal_entry_id = jeli.journal_entry_id
			INNER JOIN statement_section	AS ss ON ss.statement_section_id = ac.balance_sheet_section_id      
			WHERE ss.statement_section_code = "CA"
				AND je.debit_credit_balanced = 1
                AND je.cancelled = 0
				AND YEAR(je.entry_date) = varCalendarYear;

		## Retrieve Net Fixed Assets for Balance Sheet
		SELECT IFNULL(SUM(jeli.debit), 0) - IFNULL(SUM(jeli.credit), 0) INTO varFixedAssets
			FROM journal_entry_line_item AS jeli		
			INNER JOIN account 				AS ac ON ac.account_id = jeli.account_id
			INNER JOIN journal_entry		AS je ON je.journal_entry_id = jeli.journal_entry_id
			INNER JOIN statement_section	AS ss ON ss.statement_section_id = ac.balance_sheet_section_id      
			WHERE ss.statement_section_code = "FA"
				AND je.debit_credit_balanced = 1
                AND je.cancelled = 0
				AND YEAR(je.entry_date) = varCalendarYear;
		
        ## Retrieve Net Deferred Assets for Balance Sheet
		SELECT IFNULL(SUM(jeli.debit), 0) - IFNULL(SUM(jeli.credit), 0) INTO varDeferredAssets
			FROM journal_entry_line_item AS jeli		
			INNER JOIN account 				AS ac ON ac.account_id = jeli.account_id
			INNER JOIN journal_entry		AS je ON je.journal_entry_id = jeli.journal_entry_id
			INNER JOIN statement_section	AS ss ON ss.statement_section_id = ac.balance_sheet_section_id      
			WHERE ss.statement_section_code = "DA"
				AND je.debit_credit_balanced = 1
                AND je.cancelled = 0
				AND YEAR(je.entry_date) = varCalendarYear;
		
        ## Retrieve Net Current Liabilities for Balance Sheet
		SELECT IFNULL(SUM(jeli.credit), 0) - IFNULL(SUM(jeli.debit), 0) INTO varCurrentLiabilities
			FROM journal_entry_line_item AS jeli		
			INNER JOIN account 				AS ac ON ac.account_id = jeli.account_id
			INNER JOIN journal_entry		AS je ON je.journal_entry_id = jeli.journal_entry_id
			INNER JOIN statement_section	AS ss ON ss.statement_section_id = ac.balance_sheet_section_id      
			WHERE ss.statement_section_code = "CL"
				AND je.debit_credit_balanced = 1
                AND je.cancelled = 0
				AND YEAR(je.entry_date) = varCalendarYear;      

        ## Retrieve Net Long-term Liabilities for Balance Sheet
		SELECT IFNULL(SUM(jeli.credit), 0) - IFNULL(SUM(jeli.debit), 0) INTO varLongtermLiabilities
			FROM journal_entry_line_item AS jeli		
			INNER JOIN account 				AS ac ON ac.account_id = jeli.account_id
			INNER JOIN journal_entry		AS je ON je.journal_entry_id = jeli.journal_entry_id
			INNER JOIN statement_section	AS ss ON ss.statement_section_id = ac.balance_sheet_section_id      
			WHERE ss.statement_section_code = "LLL"
				AND je.debit_credit_balanced = 1
                AND je.cancelled = 0
				AND YEAR(je.entry_date) = varCalendarYear;

        ## Retrieve Net Deferred Liabilities for Balance Sheet
		SELECT IFNULL(SUM(jeli.credit), 0) - IFNULL(SUM(jeli.debit), 0) INTO varDeferredLiabilities
			FROM journal_entry_line_item	AS jeli		
			INNER JOIN account 				AS ac ON ac.account_id = jeli.account_id
			INNER JOIN journal_entry		AS je ON je.journal_entry_id = jeli.journal_entry_id
			INNER JOIN statement_section	AS ss ON ss.statement_section_id = ac.balance_sheet_section_id      
			WHERE ss.statement_section_code = "DL"
				AND je.debit_credit_balanced = 1
                AND je.cancelled = 0
				AND YEAR(je.entry_date) = varCalendarYear;

		## Retrieve Net Equities (Retained Earning) for Balance Sheet
        SELECT IFNULL(SUM(jeli.credit), 0) - IFNULL(SUM(jeli.debit), 0) INTO varEquity
			FROM journal_entry_line_item AS jeli		
			INNER JOIN account 				AS ac ON ac.account_id = jeli.account_id
			INNER JOIN journal_entry		AS je ON je.journal_entry_id = jeli.journal_entry_id
			INNER JOIN statement_section	AS ss ON ss.statement_section_id = ac.balance_sheet_section_id      
			WHERE ss.statement_section_code = "EQ"
				AND je.debit_credit_balanced = 1
                AND je.cancelled = 0
				AND YEAR(je.entry_date) = varCalendarYear;                
                
   		-- Let's drop the `tmp` table where we will input the revenue
		-- The IF EXISTS is important. Because if the table does not exist the DROP alone would fail
		-- A store procedure will stop running whenever it faces an error. 

		-- Create a 2019 CY Income Statement Table 
		DROP TABLE IF EXISTS team7msba2_profit_loss_table;

		CREATE TABLE team7msba2_profit_loss_table
			( 
				profit_loss_line_number INT, 
				label VARCHAR(50), 
				amount VARCHAR(50)
			);
		  
		  -- Now we insert the a header for the report
			INSERT INTO team7msba2_profit_loss_table
				(profit_loss_line_number, label, amount)
				VALUES 
				(1, 'PROFIT AND LOSS STATEMENT',			  "2019, In '000s of USD"),
                (2, '',                                       ''),
				(3, 'Total Revenues',			 		      format(varTotalRevenue / 1000, 2)),
				(4, 'LESS: Returns, Refunds, Discounts', 	  format(varReturnRefund / 1000, 2)),
				(5, 'LESS: Cost of Goods and Service',        format(varCOGS / 1000, 2)),
				(6, 'Gross Margin',		 		  			  format((varTotalRevenue - (varReturnRefund + varCOGS)) / 1000, 2)),
                (7, 'Operating Expenses',				   	  ''),
                (8, 'LESS: Administrative Expenses',   		  format(varAdministrativeExpenses / 1000, 2)),
				(9, 'LESS: Selling Expenses', 	 	 	  	  format(varSellingExpenses / 1000, 2)),
				(10, 'LESS: Other Expenses', 				  format(varOtherExpenses / 1000, 2)),
				(11, 'Operating Income', 					  ''),
				(12, 'ADD: Other Income',					  format(varOtherIncome / 1000, 2)),
				(13, 'Earnings Before Tax', 				  format((varTotalRevenue - (varReturnRefund + varCOGS) - (varAdministrativeExpenses + varSellingExpenses + varOtherExpenses) + varOtherIncome) / 1000, 2)),
				(14, 'Income Tax',				 			  format(varIncomeTax / 1000, 2)),
				(15, 'Other Tax',							  format(varOtherTax / 1000, 2)),
				(16, 'Net Income',	   	 				      format((varTotalRevenue - (varReturnRefund + varCOGS) - (varAdministrativeExpenses + varSellingExpenses + varOtherExpenses) + varOtherIncome - (varIncomeTax + varOtherTax)) / 1000, 2));

		-- Create a 2019 CY Balance Sheet Table 
		DROP TABLE IF EXISTS team7msba2_balance_sheet_table;

		CREATE TABLE team7msba2_balance_sheet_table
			( 
				balance_sheets_line_number INT, 
				label VARCHAR(50), 
				amount VARCHAR(50)
			);
		  
		  -- Now we insert the a header for the report
			INSERT INTO team7msba2_balance_sheet_table
				(balance_sheets_line_number, label, amount)
				VALUES 
				(1, 'ASSETS', 				 			      "2019, In '000s of USD"),
				(2, 'Current assets',			 		      format(varCurrentAssets / 1000, 2)),
				(3, 'Non-current assets', 	 				  ''),
				(4, '-- Fixed Assets',                        format(varFixedAssets / 1000, 2)),
				(5, '-- Deferred Assets', 		  			  format(varDeferredAssets / 1000, 2)),
                (6, '-- -- Total Non-current assets',   	  format((varFixedAssets + varDeferredAssets) / 1000, 2)),
				(7, '-- -- -- Total assets',  		 	  	  format((varCurrentAssets + varFixedAssets + varDeferredAssets) / 1000, 2)),
				(8, '', 		 							  '');

			INSERT INTO team7msba2_balance_sheet_table
				(balance_sheets_line_number, label, amount)
				VALUES 
				(9, 'LIABILITIES AND SHAREHOLDERS’ EQUITY',   ''),
				(10, 'Current liabilities',		 			  format(varCurrentLiabilities / 1000, 2)),
				(11, 'Non-current liabilities', 			  ''),
				(12, '-- Long-term debts',		 			  format(varLongtermLiabilities / 1000, 2)),
				(13, '-- Deferred liabilities',				  format(varDeferredLiabilities / 1000, 2)),
				(14, '-- -- Total Liabilities',	  			  format((varCurrentLiabilities + varLongtermLiabilities + varDeferredLiabilities) / 1000, 2)),
 				(15, 'Shareholders’ equity',				  ''),				  
				(16, '-- Equities',							  '-'),
				(17, '-- Retained Earning',					  format(varEquity / 1000, 2)),				  
				(18, '-- -- Total Shareholders’ equity',	  format(varEquity / 1000, 2)),
				(19, '-- -- -- Total Liabilities and Equity', format((varCurrentLiabilities + varLongtermLiabilities + varDeferredLiabilities + varEquity) / 1000, 2));                

END $$

DELIMITER ;

CALL team7msba2_calculate_financial_statement_sp(2019);

SELECT * FROM team7msba2_profit_loss_table;

SELECT * FROM team7msba2_balance_sheet_table;