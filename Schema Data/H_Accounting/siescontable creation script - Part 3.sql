USE H_Accounting;

DROP TABLE IF EXISTS `report_job`;
DROP TABLE IF EXISTS `report_configuration_line_item`;
DROP TABLE IF EXISTS `report_configuration`;
DROP TABLE IF EXISTS `report_criterion`;
DROP TABLE IF EXISTS `report_label`;
DROP TABLE IF EXISTS `report_order`;
DROP TABLE IF EXISTS `report`;
DROP TABLE IF EXISTS `report_group`;
DROP TABLE IF EXISTS `pbcattbl`;
DROP TABLE IF EXISTS `pbcatvld`;
DROP TABLE IF EXISTS `pbcatfmt`;
DROP TABLE IF EXISTS `pbcatedt`;
DROP TABLE IF EXISTS `pbcatcol`;
DROP TABLE IF EXISTS `ledger_serial_number`;

SET autocommit=0;
# Table structure for table 'ledger_serial_number'
CREATE TABLE `ledger_serial_number` (
  `company_id` INTEGER NOT NULL DEFAULT 0, 
  `ledger_serial_number` INTEGER NOT NULL DEFAULT 0, 
  UNIQUE (`company_id`), 
  PRIMARY KEY (`company_id`),
  
  KEY `fkIdx_151` (`company_id`) ,
  CONSTRAINT `FK_151` FOREIGN KEY `fkIdx_151` (`company_id`) REFERENCES `company` (`company_id`)

) ;

# Dumping data for table 'ledger_serial_number'
INSERT INTO `ledger_serial_number` (`company_id`, `ledger_serial_number`) VALUES (0, 0);
INSERT INTO `ledger_serial_number` (`company_id`, `ledger_serial_number`) VALUES (1, 15706);
# 2 records

# Table structure for table 'pbcatcol'
CREATE TABLE `pbcatcol` (
  `pbc_tnam` VARCHAR(65), 
  `pbc_tid` INTEGER, 
  `pbc_ownr` VARCHAR(65), 
  `pbc_cnam` VARCHAR(65), 
  `pbc_cid` INTEGER, 
  `pbc_labl` VARCHAR(254), 
  `pbc_lpos` INTEGER, 
  `pbc_hdr` VARCHAR(254), 
  `pbc_hpos` INTEGER, 
  `pbc_jtfy` INTEGER, 
  `pbc_mask` VARCHAR(31), 
  `pbc_case` INTEGER, 
  `pbc_hght` INTEGER, 
  `pbc_wdth` INTEGER, 
  `pbc_ptrn` VARCHAR(31), 
  `pbc_bmap` VARCHAR(1), 
  `pbc_init` VARCHAR(254), 
  `pbc_cmnt` VARCHAR(254), 
  `pbc_edit` VARCHAR(31), 
  `pbc_tag` VARCHAR(254), 
  UNIQUE (`pbc_tnam`, `pbc_ownr`, `pbc_cnam`)
) ;

# Table structure for table 'pbcatedt'
CREATE TABLE `pbcatedt` (
  `pbe_name` VARCHAR(30), 
  `pbe_edit` VARCHAR(254), 
  `pbe_type` INTEGER, 
  `pbe_cntr` INTEGER, 
  `pbe_seqn` INTEGER, 
  `pbe_flag` INTEGER, 
  `pbe_work` VARCHAR(32), 
  UNIQUE (`pbe_name`, `pbe_seqn`)
) ;

# Dumping data for table 'pbcatedt'
INSERT INTO `pbcatedt` (`pbe_name`, `pbe_edit`, `pbe_type`, `pbe_cntr`, `pbe_seqn`, `pbe_flag`, `pbe_work`) VALUES ('###,###.00', '###,###.00', 90, 1, 1, 32, '10                              ');
INSERT INTO `pbcatedt` (`pbe_name`, `pbe_edit`, `pbe_type`, `pbe_cntr`, `pbe_seqn`, `pbe_flag`, `pbe_work`) VALUES ('#####', '#####', 90, 1, 1, 32, '10                              ');
INSERT INTO `pbcatedt` (`pbe_name`, `pbe_edit`, `pbe_type`, `pbe_cntr`, `pbe_seqn`, `pbe_flag`, `pbe_work`) VALUES ('###-##-####', '###-##-####', 90, 1, 1, 32, '00                              ');
INSERT INTO `pbcatedt` (`pbe_name`, `pbe_edit`, `pbe_type`, `pbe_cntr`, `pbe_seqn`, `pbe_flag`, `pbe_work`) VALUES ('MM/DD/YY', 'MM/DD/YY', 90, 1, 1, 32, '20                              ');
INSERT INTO `pbcatedt` (`pbe_name`, `pbe_edit`, `pbe_type`, `pbe_cntr`, `pbe_seqn`, `pbe_flag`, `pbe_work`) VALUES ('DD/MM/YY', 'DD/MM/YY', 90, 1, 1, 32, '20                              ');
INSERT INTO `pbcatedt` (`pbe_name`, `pbe_edit`, `pbe_type`, `pbe_cntr`, `pbe_seqn`, `pbe_flag`, `pbe_work`) VALUES ('MM/DD/YYYY', 'MM/DD/YYYY', 90, 1, 1, 32, '20                              ');
INSERT INTO `pbcatedt` (`pbe_name`, `pbe_edit`, `pbe_type`, `pbe_cntr`, `pbe_seqn`, `pbe_flag`, `pbe_work`) VALUES ('DD/MM/YYYY', 'DD/MM/YYYY', 90, 1, 1, 32, '20                              ');
INSERT INTO `pbcatedt` (`pbe_name`, `pbe_edit`, `pbe_type`, `pbe_cntr`, `pbe_seqn`, `pbe_flag`, `pbe_work`) VALUES ('DD/MMM/YY', 'DD/MMM/YY', 90, 1, 1, 32, '20                              ');
INSERT INTO `pbcatedt` (`pbe_name`, `pbe_edit`, `pbe_type`, `pbe_cntr`, `pbe_seqn`, `pbe_flag`, `pbe_work`) VALUES ('DDD/YY', 'DDD/YY', 90, 1, 1, 32, '20                              ');
INSERT INTO `pbcatedt` (`pbe_name`, `pbe_edit`, `pbe_type`, `pbe_cntr`, `pbe_seqn`, `pbe_flag`, `pbe_work`) VALUES ('DDD/YYYY', 'DDD/YYYY', 90, 1, 1, 32, '20                              ');
INSERT INTO `pbcatedt` (`pbe_name`, `pbe_edit`, `pbe_type`, `pbe_cntr`, `pbe_seqn`, `pbe_flag`, `pbe_work`) VALUES ('HH:MM:SS', 'HH:MM:SS', 90, 1, 1, 32, '30                              ');
INSERT INTO `pbcatedt` (`pbe_name`, `pbe_edit`, `pbe_type`, `pbe_cntr`, `pbe_seqn`, `pbe_flag`, `pbe_work`) VALUES ('HH:MM:SS:FFF', 'HH:MM:SS:FFF', 90, 1, 1, 32, '30                              ');
INSERT INTO `pbcatedt` (`pbe_name`, `pbe_edit`, `pbe_type`, `pbe_cntr`, `pbe_seqn`, `pbe_flag`, `pbe_work`) VALUES ('HH:MM:SS:FFFFFF', 'HH:MM:SS:FFFFFF', 90, 1, 1, 32, '30                              ');
INSERT INTO `pbcatedt` (`pbe_name`, `pbe_edit`, `pbe_type`, `pbe_cntr`, `pbe_seqn`, `pbe_flag`, `pbe_work`) VALUES ('MM/DD/YY HH:MM:SS', 'MM/DD/YY HH:MM:SS', 90, 1, 1, 32, '40                              ');
INSERT INTO `pbcatedt` (`pbe_name`, `pbe_edit`, `pbe_type`, `pbe_cntr`, `pbe_seqn`, `pbe_flag`, `pbe_work`) VALUES ('DD/MM/YY HH:MM:SS', 'DD/MM/YY HH:MM:SS', 90, 1, 1, 32, '40                              ');
INSERT INTO `pbcatedt` (`pbe_name`, `pbe_edit`, `pbe_type`, `pbe_cntr`, `pbe_seqn`, `pbe_flag`, `pbe_work`) VALUES ('MM/DD/YYYY HH:MM:SS', 'MM/DD/YYYY HH:MM:SS', 90, 1, 1, 32, '40                              ');
INSERT INTO `pbcatedt` (`pbe_name`, `pbe_edit`, `pbe_type`, `pbe_cntr`, `pbe_seqn`, `pbe_flag`, `pbe_work`) VALUES ('DD/MM/YYYY HH:MM:SS', 'DD/MM/YYYY HH:MM:SS', 90, 1, 1, 32, '40                              ');
INSERT INTO `pbcatedt` (`pbe_name`, `pbe_edit`, `pbe_type`, `pbe_cntr`, `pbe_seqn`, `pbe_flag`, `pbe_work`) VALUES ('DD/MMM/YY HH:MM:SS', 'DD/MMM/YY HH:MM:SS', 90, 1, 1, 32, '40                              ');
INSERT INTO `pbcatedt` (`pbe_name`, `pbe_edit`, `pbe_type`, `pbe_cntr`, `pbe_seqn`, `pbe_flag`, `pbe_work`) VALUES ('DDD/YY HH:MM:SS', 'DDD/YY HH:MM:SS', 90, 1, 1, 32, '40                              ');
INSERT INTO `pbcatedt` (`pbe_name`, `pbe_edit`, `pbe_type`, `pbe_cntr`, `pbe_seqn`, `pbe_flag`, `pbe_work`) VALUES ('DDD/YYYY HH:MM:SS', 'DDD/YYYY HH:MM:SS', 90, 1, 1, 32, '40                              ');
INSERT INTO `pbcatedt` (`pbe_name`, `pbe_edit`, `pbe_type`, `pbe_cntr`, `pbe_seqn`, `pbe_flag`, `pbe_work`) VALUES ('DD/MM/YY HH:MM:SS:FFFFFF', 'DD/MM/YY HH:MM:SS:FFFFFF', 90, 1, 1, 32, '40                              ');
# 21 records

# Table structure for table 'pbcatfmt'
CREATE TABLE `pbcatfmt` (
  `pbf_name` VARCHAR(30), 
  `pbf_frmt` VARCHAR(254), 
  `pbf_type` INTEGER, 
  `pbf_cntr` INTEGER, 
  UNIQUE (`pbf_name`)
) ;

# Dumping data for table 'pbcatfmt'
INSERT INTO `pbcatfmt` (`pbf_name`, `pbf_frmt`, `pbf_type`, `pbf_cntr`) VALUES ('[General]', '[General]', 81, 0);
INSERT INTO `pbcatfmt` (`pbf_name`, `pbf_frmt`, `pbf_type`, `pbf_cntr`) VALUES ('0', '0', 81, 0);
INSERT INTO `pbcatfmt` (`pbf_name`, `pbf_frmt`, `pbf_type`, `pbf_cntr`) VALUES ('0.00', '0.00', 81, 0);
INSERT INTO `pbcatfmt` (`pbf_name`, `pbf_frmt`, `pbf_type`, `pbf_cntr`) VALUES ('#,##0', '#,##0', 81, 0);
INSERT INTO `pbcatfmt` (`pbf_name`, `pbf_frmt`, `pbf_type`, `pbf_cntr`) VALUES ('#,##0.00', '#,##0.00', 81, 0);
INSERT INTO `pbcatfmt` (`pbf_name`, `pbf_frmt`, `pbf_type`, `pbf_cntr`) VALUES ('$#,##0;($#,##0)', '$#,##0;($#,##0)', 81, 0);
INSERT INTO `pbcatfmt` (`pbf_name`, `pbf_frmt`, `pbf_type`, `pbf_cntr`) VALUES ('$#,##0;[RED]($#,##0)', '$#,##0;[RED]($#,##0)', 81, 0);
INSERT INTO `pbcatfmt` (`pbf_name`, `pbf_frmt`, `pbf_type`, `pbf_cntr`) VALUES ('$#,##0.00;($#,##0.00)', '$#,##0.00;($#,##0.00)', 81, 0);
INSERT INTO `pbcatfmt` (`pbf_name`, `pbf_frmt`, `pbf_type`, `pbf_cntr`) VALUES ('$#,##0.00;[RED]($#,##0.00)', '$#,##0.00;[RED]($#,##0.00)', 81, 0);
INSERT INTO `pbcatfmt` (`pbf_name`, `pbf_frmt`, `pbf_type`, `pbf_cntr`) VALUES ('0%', '0%', 81, 0);
INSERT INTO `pbcatfmt` (`pbf_name`, `pbf_frmt`, `pbf_type`, `pbf_cntr`) VALUES ('0.00%', '0.00%', 81, 0);
INSERT INTO `pbcatfmt` (`pbf_name`, `pbf_frmt`, `pbf_type`, `pbf_cntr`) VALUES ('0.00E+00', '0.00E+00', 81, 0);
INSERT INTO `pbcatfmt` (`pbf_name`, `pbf_frmt`, `pbf_type`, `pbf_cntr`) VALUES ('m/d/yy', 'm/d/yy', 84, 0);
INSERT INTO `pbcatfmt` (`pbf_name`, `pbf_frmt`, `pbf_type`, `pbf_cntr`) VALUES ('d-mmm-yy', 'd-mmm-yy', 84, 0);
INSERT INTO `pbcatfmt` (`pbf_name`, `pbf_frmt`, `pbf_type`, `pbf_cntr`) VALUES ('d-mmm', 'd-mmm', 84, 0);
INSERT INTO `pbcatfmt` (`pbf_name`, `pbf_frmt`, `pbf_type`, `pbf_cntr`) VALUES ('mmm-yy', 'mmm-yy', 84, 0);
INSERT INTO `pbcatfmt` (`pbf_name`, `pbf_frmt`, `pbf_type`, `pbf_cntr`) VALUES ('h:mm AM/PM', 'h:mm AM/PM', 84, 0);
INSERT INTO `pbcatfmt` (`pbf_name`, `pbf_frmt`, `pbf_type`, `pbf_cntr`) VALUES ('h:mm:ss AM/PM', 'h:mm:ss AM/PM', 84, 0);
INSERT INTO `pbcatfmt` (`pbf_name`, `pbf_frmt`, `pbf_type`, `pbf_cntr`) VALUES ('h:mm:ss', 'h:mm:ss', 84, 0);
INSERT INTO `pbcatfmt` (`pbf_name`, `pbf_frmt`, `pbf_type`, `pbf_cntr`) VALUES ('m/d/yy h:mm', 'm/d/yy h:mm', 84, 0);
# 20 records

# Table structure for table 'pbcattbl'
CREATE TABLE `pbcattbl` (
  `pbt_tnam` VARCHAR(65), 
  `pbt_tid` INTEGER, 
  `pbt_ownr` VARCHAR(65), 
  `pbd_fhgt` INTEGER, 
  `pbd_fwgt` INTEGER, 
  `pbd_fitl` VARCHAR(1), 
  `pbd_funl` VARCHAR(1), 
  `pbd_fchr` INTEGER, 
  `pbd_fptc` INTEGER, 
  `pbd_ffce` VARCHAR(18), 
  `pbh_fhgt` INTEGER, 
  `pbh_fwgt` INTEGER, 
  `pbh_fitl` VARCHAR(1), 
  `pbh_funl` VARCHAR(1), 
  `pbh_fchr` INTEGER, 
  `pbh_fptc` INTEGER, 
  `pbh_ffce` VARCHAR(18), 
  `pbl_fhgt` INTEGER, 
  `pbl_fwgt` INTEGER, 
  `pbl_fitl` VARCHAR(1), 
  `pbl_funl` VARCHAR(1), 
  `pbl_fchr` INTEGER, 
  `pbl_fptc` INTEGER, 
  `pbl_ffce` VARCHAR(18), 
  `pbt_cmnt` VARCHAR(254), 
  UNIQUE (`pbt_tnam`, `pbt_ownr`)
) ;

# Table structure for table 'pbcatvld'
CREATE TABLE `pbcatvld` (
  `pbv_name` VARCHAR(30), 
  `pbv_vald` VARCHAR(254), 
  `pbv_type` INTEGER, 
  `pbv_cntr` INTEGER, 
  `pbv_msg` VARCHAR(254), 
  UNIQUE (`pbv_name`)
) ;

# Table structure for table 'report_group'
CREATE TABLE `report_group` (
  `report_group_id` INTEGER NOT NULL, 
  `company_id` INTEGER NOT NULL DEFAULT 0, 
  `report_group_code` VARCHAR(10) NOT NULL DEFAULT '', 
  `report_group` VARCHAR(30) NOT NULL DEFAULT '', 
  PRIMARY KEY (`report_group_id`), 

  KEY `fkIdx_161` (`company_id`) ,
  CONSTRAINT `FK_161` FOREIGN KEY `fkIdx_161` (`company_id`) REFERENCES `company` (`company_id`)
) ;

SET autocommit=0;
# Dumping data for table 'report_group'
INSERT INTO `report_group` (`report_group_id`, `company_id`, `report_group_code`, `report_group`) VALUES (0, 0, '', '');
INSERT INTO `report_group` (`report_group_id`, `company_id`, `report_group_code`, `report_group`) VALUES (1, 1, '1', 'FINANCIAL STATEMENTS');
INSERT INTO `report_group` (`report_group_id`, `company_id`, `report_group_code`, `report_group`) VALUES (2, 1, '2', 'TRIAL BALANCE');
INSERT INTO `report_group` (`report_group_id`, `company_id`, `report_group_code`, `report_group`) VALUES (3, 1, '3', 'LEDGER');
INSERT INTO `report_group` (`report_group_id`, `company_id`, `report_group_code`, `report_group`) VALUES (4, 1, '4', 'OTHER REPORTS');
INSERT INTO `report_group` (`report_group_id`, `company_id`, `report_group_code`, `report_group`) VALUES (5, 1, '5', 'FISCAL REPORTS');
INSERT INTO `report_group` (`report_group_id`, `company_id`, `report_group_code`, `report_group`) VALUES (6, 1, '6', 'CHECKBOOK REPORTS');
# 7 records
COMMIT;


# Table structure for table 'report'
CREATE TABLE `report` (
  `report_id` INTEGER NOT NULL, 
  `company_id` INTEGER NOT NULL DEFAULT 0, 
  `report_group_id` INTEGER NOT NULL DEFAULT 0, 
  `report_code` VARCHAR(10) NOT NULL DEFAULT '', 
  `report` VARCHAR(100) NOT NULL DEFAULT '', 
  `object` VARCHAR(100) NOT NULL DEFAULT '', 
  `object_summary` VARCHAR(100) NOT NULL DEFAULT '', 
  `orientation` VARCHAR(1) NOT NULL DEFAULT '', 
  `footer` INTEGER NOT NULL DEFAULT 0, 
  `help_text` VARCHAR(100) NOT NULL DEFAULT '', 
  `summary` INTEGER NOT NULL DEFAULT 0, 
  `function_name` VARCHAR(100) NOT NULL DEFAULT '', 
  PRIMARY KEY (`report_id`),
  
  KEY `fkIdx_171` (`company_id`) ,
  CONSTRAINT `FK_171` FOREIGN KEY `fkIdx_41` (`company_id`) REFERENCES `company` (`company_id`), 
  
  KEY `fkIdx_1716` (`report_group_id`) ,
  CONSTRAINT `FK_1716` FOREIGN KEY `fkIdx_1716` (`report_group_id`) REFERENCES `report_group` (`report_group_id`)
) ;

# Dumping data for table 'report'
INSERT INTO `report` (`report_id`, `company_id`, `report_group_id`, `report_code`, `report`, `object`, `object_summary`, `orientation`, `footer`, `help_text`, `summary`, `function_name`) VALUES (0, 0, 0, '', '', '', '', '', 0, '', 0, '');
INSERT INTO `report` (`report_id`, `company_id`, `report_group_id`, `report_code`, `report`, `object`, `object_summary`, `orientation`, `footer`, `help_text`, `summary`, `function_name`) VALUES (1, 1, 1, '1', 'Balance Sheet (no detail)', 'd_rep_balance_general_mayor', '', 'V', 0, 'Balance Sheet with accounts that do not allow posting', 0, 'uf_x_rep_prepare_balance_sheet_no_detail');
INSERT INTO `report` (`report_id`, `company_id`, `report_group_id`, `report_code`, `report`, `object`, `object_summary`, `orientation`, `footer`, `help_text`, `summary`, `function_name`) VALUES (2, 1, 1, '2', 'Profit and Loss (no detail)', 'd_rep_estado_resultado_mayor', '', 'V', 0, 'Profit and Loss statement with accounts that do not allow posting', 0, 'uf_x_rep_prepare_profit_loss_no_detail');
INSERT INTO `report` (`report_id`, `company_id`, `report_group_id`, `report_code`, `report`, `object`, `object_summary`, `orientation`, `footer`, `help_text`, `summary`, `function_name`) VALUES (3, 1, 1, '3', 'Balance Sheet (detailed)', 'd_rep_balance_general_detalle', '', 'V', 0, 'Balance Sheet showing detailed accounts (postable)', 0, 'uf_x_rep_prepare_balance_sheet_detailed');
INSERT INTO `report` (`report_id`, `company_id`, `report_group_id`, `report_code`, `report`, `object`, `object_summary`, `orientation`, `footer`, `help_text`, `summary`, `function_name`) VALUES (4, 1, 1, '4', 'Profit and Loss (detailed)', 'd_rep_estado_resultado_detalle', '', 'V', 0, 'Proft and Loss statement showing detailed accounts (postable)', 0, 'uf_x_rep_prepare_profit_loss_detailed');
INSERT INTO `report` (`report_id`, `company_id`, `report_group_id`, `report_code`, `report`, `object`, `object_summary`, `orientation`, `footer`, `help_text`, `summary`, `function_name`) VALUES (5, 1, 2, '1', 'Trial Balance (no detail)', 'd_rep_balanza_comprobacion_mayor', '', 'V', 0, 'Trial Balance report with accounts that do not allow posting', 0, 'uf_x_rep_prepare_trial_balance_no_detail');
INSERT INTO `report` (`report_id`, `company_id`, `report_group_id`, `report_code`, `report`, `object`, `object_summary`, `orientation`, `footer`, `help_text`, `summary`, `function_name`) VALUES (6, 1, 2, '2', 'Trial Balance (detailed)', 'd_rep_balanza_comprobacion_detalle', '', 'V', 1, 'Trial Balance report showing detailed accounts (postable)', 0, 'uf_x_rep_prepare_trial_balance_detailed');
INSERT INTO `report` (`report_id`, `company_id`, `report_group_id`, `report_code`, `report`, `object`, `object_summary`, `orientation`, `footer`, `help_text`, `summary`, `function_name`) VALUES (7, 1, 3, '1', 'General Ledger (no detail)', 'd_rep_libro_mayor', '', 'V', 1, 'Current balances at top-level accounts (non-postable)', 0, 'uf_x_rep_prepare_ledger_no_detail');
INSERT INTO `report` (`report_id`, `company_id`, `report_group_id`, `report_code`, `report`, `object`, `object_summary`, `orientation`, `footer`, `help_text`, `summary`, `function_name`) VALUES (8, 1, 3, '2', 'General Ledger (detail)', 'd_rep_libro_diario', '', 'V', 1, 'Current balances showing the postings on each account', 0, 'uf_x_rep_prepare_ledger_detailed');
INSERT INTO `report` (`report_id`, `company_id`, `report_group_id`, `report_code`, `report`, `object`, `object_summary`, `orientation`, `footer`, `help_text`, `summary`, `function_name`) VALUES (9, 1, 4, '1', 'Assets Accounts Summary', 'd_rep_cedula_activo', '', 'V', 0, 'Details line items for accounts in the Assets group', 0, 'uf_x_rep_prepare_assets_accounts');
INSERT INTO `report` (`report_id`, `company_id`, `report_group_id`, `report_code`, `report`, `object`, `object_summary`, `orientation`, `footer`, `help_text`, `summary`, `function_name`) VALUES (10, 1, 4, '2', 'Liability Accounts Summary', 'd_rep_cedula_pasivo', '', 'V', 0, 'Details line items for accounts in the Liabilities group', 0, 'uf_x_rep_prepare_liabilities_accounts');
INSERT INTO `report` (`report_id`, `company_id`, `report_group_id`, `report_code`, `report`, `object`, `object_summary`, `orientation`, `footer`, `help_text`, `summary`, `function_name`) VALUES (11, 1, 5, '1', 'Gain and loss inflationary', 'd_rep_inflacionaria', '', 'V', 1, '', 1, 'uf_x_rep_prepare_inflationary_gain');
INSERT INTO `report` (`report_id`, `company_id`, `report_group_id`, `report_code`, `report`, `object`, `object_summary`, `orientation`, `footer`, `help_text`, `summary`, `function_name`) VALUES (12, 1, 5, '2', 'Gain and loss inflationary - Daily', 'd_rep_inflacionaria_diaria', '', 'H', 1, '', 0, 'uf_x_rep_prepare_inflationary_gain_daily');
INSERT INTO `report` (`report_id`, `company_id`, `report_group_id`, `report_code`, `report`, `object`, `object_summary`, `orientation`, `footer`, `help_text`, `summary`, `function_name`) VALUES (13, 1, 5, '3', 'Tax Returns', 'd_rep_declaracion', '', 'V', 0, 'Prepare the summary of balances needed for a Tax Return', 0, 'uf_x_rep_prepare_tax_return_balances');
INSERT INTO `report` (`report_id`, `company_id`, `report_group_id`, `report_code`, `report`, `object`, `object_summary`, `orientation`, `footer`, `help_text`, `summary`, `function_name`) VALUES (14, 1, 6, '1', 'Checkbook Reconciliation', 'd_rep_conciliacion_bancaria', '', 'H', 1, 'Details checkbook accounts', 0, 'uf_x_rep_prepare_checbook_reconciliation');
INSERT INTO `report` (`report_id`, `company_id`, `report_group_id`, `report_code`, `report`, `object`, `object_summary`, `orientation`, `footer`, `help_text`, `summary`, `function_name`) VALUES (15, 1, 5, '4', 'VAT Tax Reconciliation', 'd_rep_iva_por_pagar', '', 'H', 1, 'Summary of collected and accrued VAT', 0, 'uf_x_rep_prepare_vat_summary');
# 16 records


# Table structure for table 'report_order'
CREATE TABLE `report_order` (
  `report_order_id` INTEGER NOT NULL, 
  `company_id` INTEGER NOT NULL DEFAULT 0, 
  `report_id` INTEGER NOT NULL DEFAULT 0, 
  `report_order_code` VARCHAR(5) NOT NULL DEFAULT '', 
  `report_order` VARCHAR(30) NOT NULL DEFAULT '', 
  PRIMARY KEY (`report_order_id`), 

  KEY `fkIdx_181` (`company_id`) ,
  CONSTRAINT `FK_181` FOREIGN KEY `fkIdx_181` (`company_id`) REFERENCES `company` (`company_id`)
) ;

SET autocommit=0;
# Dumping data for table 'report_order'
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (0, 0, 0, '', '');
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (1, 1, 1, '1', 'NATURAL');
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (2, 1, 2, '1', 'NATURAL');
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (3, 1, 3, '1', 'NATURAL');
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (4, 1, 4, '1', 'NATURAL');
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (5, 1, 5, '1', 'ACCOUNT');
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (6, 1, 6, '1', 'ACCOUNT');
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (7, 1, 7, '1', 'ACCOUNT');
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (8, 1, 8, '1', 'DATE');
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (9, 1, 9, '1', 'ACCOUNT');
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (10, 1, 9, '2', 'DESCRIPTION');
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (11, 1, 9, '3', 'BALANCE');
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (12, 1, 10, '1', 'ACCOUNT');
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (13, 1, 10, '2', 'DESCRIPTION');
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (14, 1, 10, '3', 'BALANCE');
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (15, 1, 11, '1', 'ACCOUNT CODE');
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (16, 1, 11, '2', 'ACCOUNT');
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (17, 1, 12, '1', 'ACCOUNT CODE');
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (18, 1, 12, '2', 'ACCOUNT');
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (20, 1, 13, '1', 'NATURAL');
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (21, 1, 14, '1', 'JOURNAL ENTRY DATE');
INSERT INTO `report_order` (`report_order_id`, `company_id`, `report_id`, `report_order_code`, `report_order`) VALUES (22, 1, 14, '2', 'BANK STATEMENT DATE');
# 22 records
COMMIT;


# Table structure for table 'report_label'
CREATE TABLE `report_label` (
  `report_label_id` INTEGER NOT NULL, 
  `company_id` INTEGER NOT NULL DEFAULT 0, 
  `report_label_code` VARCHAR(20) NOT NULL DEFAULT '', 
  `report_label` VARCHAR(100) NOT NULL DEFAULT '', 
  `report_label_order` INTEGER NOT NULL DEFAULT 0, 
  INDEX (`report_label_code`), 
  INDEX (`report_label_id`), 
  INDEX (`company_id`), 
  PRIMARY KEY (`report_label_id`),
  
  KEY `fkIdx_191` (`company_id`) ,
  CONSTRAINT `FK_191` FOREIGN KEY `fkIdx_191` (`company_id`) REFERENCES `company` (`company_id`)
) ;

SET autocommit=0;
# Dumping data for table 'report_label'
INSERT INTO `report_label` (`report_label_id`, `company_id`, `report_label_code`, `report_label`, `report_label_order`) VALUES (18, 1, 'REV', 'REVENUE', 1);
INSERT INTO `report_label` (`report_label_id`, `company_id`, `report_label_code`, `report_label`, `report_label_order`) VALUES (19, 1, 'RETREV', 'RETURNS AND DISCOUNTS', 2);
INSERT INTO `report_label` (`report_label_id`, `company_id`, `report_label_code`, `report_label`, `report_label_order`) VALUES (20, 1, 'VAT_CHAR', 'RETAINED VAT', 3);
INSERT INTO `report_label` (`report_label_id`, `company_id`, `report_label_code`, `report_label`, `report_label_order`) VALUES (21, 1, 'IVA_LFY', 'VAT TO BE CREDIT FROM PREVIOUS FY', 4);
INSERT INTO `report_label` (`report_label_id`, `company_id`, `report_label_code`, `report_label`, `report_label_order`) VALUES (22, 1, 'IVA_FY', 'VAT TO BE CREDIT FROM THIS FY', 5);
INSERT INTO `report_label` (`report_label_id`, `company_id`, `report_label_code`, `report_label`, `report_label_order`) VALUES (23, 1, 'PAID', 'INTERIM PAYMENTS', 6);
# 6 records
COMMIT;

# Table structure for table 'report_criterion'
CREATE TABLE `report_criterion` (
  `criterion_id` INTEGER NOT NULL DEFAULT 0, 
  `report_id` INTEGER NOT NULL DEFAULT 0, 
  `report_criterion_order` INTEGER NOT NULL DEFAULT 0, 
  INDEX (`criterion_id`), 
  PRIMARY KEY (`criterion_id`, `report_id`), 
  INDEX (`report_id`),
  
  KEY `fkIdx_208` (`criterion_id`) ,
  CONSTRAINT `FK_208` FOREIGN KEY `fkIdx_208` (`criterion_id`) REFERENCES `criterion` (`criterion_id`),

  KEY `fkIdx_2017` (`report_id`) ,
  CONSTRAINT `FK_2017` FOREIGN KEY `fkIdx_2017` (`report_id`) REFERENCES `report` (`report_id`)

) ;

SET autocommit=0;
# Dumping data for table 'report_criterion'
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (0, 0, 0);
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (1, 1, 1);
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (1, 3, 1);
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (2, 2, 1);
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (2, 4, 1);
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (2, 5, 1);
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (2, 6, 1);
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (2, 7, 1);
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (2, 8, 1);
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (2, 9, 2);
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (2, 10, 2);
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (2, 13, 1);
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (2, 14, 1);
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (3, 7, 2);
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (3, 9, 1);
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (3, 10, 1);
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (3, 11, 1);
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (3, 12, 1);
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (3, 14, 2);
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (4, 11, 2);
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (4, 12, 2);
INSERT INTO `report_criterion` (`criterion_id`, `report_id`, `report_criterion_order`) VALUES (4, 15, 1);
# 22 records
COMMIT;

CREATE TABLE `report_configuration` (
  `report_configuration_id` INTEGER NOT NULL, 
  `company_id` INTEGER NOT NULL DEFAULT 0, 
  `report_id` INTEGER NOT NULL DEFAULT 0, 
  `report_concept_id` INTEGER NOT NULL DEFAULT 0, 
  INDEX (`report_concept_id`), 
  INDEX (`report_configuration_id`), 
  INDEX (`company_id`), 
  PRIMARY KEY (`report_configuration_id`), 
  INDEX (`report_id`),
  
  KEY `fkIdx_211` (`company_id`) ,
  CONSTRAINT `FK_211` FOREIGN KEY `fkIdx_211` (`company_id`) REFERENCES `company` (`company_id`),
  
  KEY `fkIdx_2117` (`report_id`) ,
  CONSTRAINT `FK_2117` FOREIGN KEY `fkIdx_2117` (`report_id`) REFERENCES `report` (`report_id`)
) ;

# Dumping data for table 'report_configuration'
INSERT INTO `report_configuration` (`report_configuration_id`, `company_id`, `report_id`, `report_concept_id`) VALUES (17, 1, 15, 18);
INSERT INTO `report_configuration` (`report_configuration_id`, `company_id`, `report_id`, `report_concept_id`) VALUES (18, 1, 15, 19);
INSERT INTO `report_configuration` (`report_configuration_id`, `company_id`, `report_id`, `report_concept_id`) VALUES (19, 1, 15, 20);
INSERT INTO `report_configuration` (`report_configuration_id`, `company_id`, `report_id`, `report_concept_id`) VALUES (20, 1, 15, 21);
INSERT INTO `report_configuration` (`report_configuration_id`, `company_id`, `report_id`, `report_concept_id`) VALUES (21, 1, 15, 22);
INSERT INTO `report_configuration` (`report_configuration_id`, `company_id`, `report_id`, `report_concept_id`) VALUES (22, 1, 15, 23);
# 6 records

# Table structure for table 'report_configuration_line_item'
CREATE TABLE `report_configuration_line_item` (
  `report_configuration_id` INTEGER NOT NULL DEFAULT 0, 
  `line_item` INTEGER NOT NULL DEFAULT 0, 
  `company_id` INTEGER NOT NULL DEFAULT 0, 
  `account_code_from` VARCHAR(100) NOT NULL DEFAULT '', 
  `account_code_until` VARCHAR(100) NOT NULL DEFAULT '', 
  `debit` INTEGER, 
  `including_concept` VARCHAR(255) NOT NULL DEFAULT '', 
  `excluding_concept` VARCHAR(255) NOT NULL DEFAULT '', 
  INDEX (`company_id`), 
  PRIMARY KEY (`report_configuration_id`, `line_item`), 
  
  KEY `fkIdx_2221` (`report_configuration_id`) ,
  CONSTRAINT `FK_2221` FOREIGN KEY `fkIdx_2221` (`report_configuration_id`) REFERENCES `report_configuration` (`report_configuration_id`),
	
  KEY `fkIdx_221` (`company_id`) ,
  CONSTRAINT `FK_221` FOREIGN KEY `fkIdx_221` (`company_id`) REFERENCES `company` (`company_id`)
) ;

SET autocommit=0;
# Dumping data for table 'report_configuration_line_item'
INSERT INTO `report_configuration_line_item` (`report_configuration_id`, `line_item`, `company_id`, `account_code_from`, `account_code_until`, `debit`, `including_concept`, `excluding_concept`) VALUES (17, 1, 1, '5000', '5001-99', 0, '', '');
INSERT INTO `report_configuration_line_item` (`report_configuration_id`, `line_item`, `company_id`, `account_code_from`, `account_code_until`, `debit`, `including_concept`, `excluding_concept`) VALUES (18, 1, 1, '5002', '5002-99', 0, '', '');
INSERT INTO `report_configuration_line_item` (`report_configuration_id`, `line_item`, `company_id`, `account_code_from`, `account_code_until`, `debit`, `including_concept`, `excluding_concept`) VALUES (19, 1, 1, '2002', '2002-99', 0, '', '');
INSERT INTO `report_configuration_line_item` (`report_configuration_id`, `line_item`, `company_id`, `account_code_from`, `account_code_until`, `debit`, `including_concept`, `excluding_concept`) VALUES (20, 1, 1, '2001-04', '2001-04', 0, '', '');
INSERT INTO `report_configuration_line_item` (`report_configuration_id`, `line_item`, `company_id`, `account_code_from`, `account_code_until`, `debit`, `including_concept`, `excluding_concept`) VALUES (21, 1, 1, '2001-04', '2001-04', 1, '', '%PAYMENT%');
INSERT INTO `report_configuration_line_item` (`report_configuration_id`, `line_item`, `company_id`, `account_code_from`, `account_code_until`, `debit`, `including_concept`, `excluding_concept`) VALUES (22, 1, 1, '2001-04', '2001-04', 1, '%PAYMENT%', '');
# 6 records
COMMIT;

# Table structure for table 'report_job'
CREATE TABLE `report_job` (
  `report_job_id` INTEGER NOT NULL, 
  `company_id` INTEGER NOT NULL DEFAULT 0, 
  `report_id` INTEGER NOT NULL DEFAULT 0, 
  `report_order_id` INTEGER NOT NULL DEFAULT 0, 
  `report_job` INTEGER NOT NULL DEFAULT 0, 
  `summary` INTEGER NOT NULL DEFAULT 0, 
  `printing_queue` INTEGER NOT NULL DEFAULT 0, 
  `cycle` VARCHAR(1) NOT NULL DEFAULT '', 
  `scheduled_date` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP, 
  `batch_generated_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  `bath_end_date` TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  `filename` VARCHAR(255) NOT NULL DEFAULT '', 
  `user_id` INTEGER NOT NULL DEFAULT 0, 
  PRIMARY KEY (`report_job_id`),
  
  KEY `fkIdx_231` (`company_id`) ,
  CONSTRAINT `FK_231` FOREIGN KEY `fkIdx_231` (`company_id`) REFERENCES `company` (`company_id`),

  KEY `fkIdx_2317` (`report_id`) ,
  CONSTRAINT `FK_2317` FOREIGN KEY `fkIdx_2317` (`report_id`) REFERENCES `report` (`report_id`),
  
  KEY `fkIdx_2318` (`report_order_id`) ,
  CONSTRAINT `FK_2318` FOREIGN KEY `fkIdx_2318` (`report_order_id`) REFERENCES `report_order` (`report_order_id`),
  
  KEY `fkIdx_232` (`user_id`) ,
  CONSTRAINT `FK_232` FOREIGN KEY `fkIdx_232` (`user_id`) REFERENCES `user` (`user_id`)
) ;

SET autocommit=0;
# Dumping data for table 'report_job'
INSERT INTO `report_job` (`report_job_id`, `company_id`, `report_id`, `report_order_id`, `report_job`, `summary`, `printing_queue`, `cycle`, `scheduled_date`, `batch_generated_date`, `bath_end_date`, `filename`, `user_id`) VALUES (0, 0, 0, 0, 0, 0, 0, '', '2002-04-16 12:21:31', '2002-04-16 12:21:31', '2002-04-16 12:21:31', '', 0);
INSERT INTO `report_job` (`report_job_id`, `company_id`, `report_id`, `report_order_id`, `report_job`, `summary`, `printing_queue`, `cycle`, `scheduled_date`, `batch_generated_date`, `bath_end_date`, `filename`, `user_id`) VALUES (3114, 1, 6, 6, 3114, 0, 0, '', '2015-01-14 17:34:12', NULL, NULL, '', 3);
INSERT INTO `report_job` (`report_job_id`, `company_id`, `report_id`, `report_order_id`, `report_job`, `summary`, `printing_queue`, `cycle`, `scheduled_date`, `batch_generated_date`, `bath_end_date`, `filename`, `user_id`) VALUES (3136, 1, 7, 7, 3136, 0, 0, '', '2015-03-13 10:01:53', NULL, NULL, '', 2);
INSERT INTO `report_job` (`report_job_id`, `company_id`, `report_id`, `report_order_id`, `report_job`, `summary`, `printing_queue`, `cycle`, `scheduled_date`, `batch_generated_date`, `bath_end_date`, `filename`, `user_id`) VALUES (3195, 1, 7, 7, 3195, 0, 0, '', '2015-10-16 10:10:42', NULL, NULL, '', 4);
INSERT INTO `report_job` (`report_job_id`, `company_id`, `report_id`, `report_order_id`, `report_job`, `summary`, `printing_queue`, `cycle`, `scheduled_date`, `batch_generated_date`, `bath_end_date`, `filename`, `user_id`) VALUES (3196, 1, 7, 7, 3196, 0, 0, '', '2015-10-16 10:10:53', NULL, NULL, '', 4);
INSERT INTO `report_job` (`report_job_id`, `company_id`, `report_id`, `report_order_id`, `report_job`, `summary`, `printing_queue`, `cycle`, `scheduled_date`, `batch_generated_date`, `bath_end_date`, `filename`, `user_id`) VALUES (3197, 1, 7, 7, 3197, 0, 0, '', '2015-10-16 10:11:23', NULL, NULL, '', 4);
INSERT INTO `report_job` (`report_job_id`, `company_id`, `report_id`, `report_order_id`, `report_job`, `summary`, `printing_queue`, `cycle`, `scheduled_date`, `batch_generated_date`, `bath_end_date`, `filename`, `user_id`) VALUES (3253, 1, 7, 7, 3253, 0, 0, '', '2016-05-16 15:15:36', NULL, NULL, '', 4);
INSERT INTO `report_job` (`report_job_id`, `company_id`, `report_id`, `report_order_id`, `report_job`, `summary`, `printing_queue`, `cycle`, `scheduled_date`, `batch_generated_date`, `bath_end_date`, `filename`, `user_id`) VALUES (3258, 1, 7, 7, 3258, 0, 0, '', '2016-06-15 16:32:14', NULL, NULL, '', 4);
INSERT INTO `report_job` (`report_job_id`, `company_id`, `report_id`, `report_order_id`, `report_job`, `summary`, `printing_queue`, `cycle`, `scheduled_date`, `batch_generated_date`, `bath_end_date`, `filename`, `user_id`) VALUES (3269, 1, 7, 7, 3269, 0, 0, '', '2016-08-16 11:23:20', NULL, NULL, '', 4);
INSERT INTO `report_job` (`report_job_id`, `company_id`, `report_id`, `report_order_id`, `report_job`, `summary`, `printing_queue`, `cycle`, `scheduled_date`, `batch_generated_date`, `bath_end_date`, `filename`, `user_id`) VALUES (3293, 1, 7, 7, 3293, 0, 0, '', '2016-12-15 12:22:00', NULL, NULL, '', 4);
INSERT INTO `report_job` (`report_job_id`, `company_id`, `report_id`, `report_order_id`, `report_job`, `summary`, `printing_queue`, `cycle`, `scheduled_date`, `batch_generated_date`, `bath_end_date`, `filename`, `user_id`) VALUES (3308, 1, 6, 6, 3308, 0, 0, '', '2017-01-18 12:59:10', NULL, NULL, '', 4);
INSERT INTO `report_job` (`report_job_id`, `company_id`, `report_id`, `report_order_id`, `report_job`, `summary`, `printing_queue`, `cycle`, `scheduled_date`, `batch_generated_date`, `bath_end_date`, `filename`, `user_id`) VALUES (3322, 1, 6, 6, 3322, 0, 0, '', '2017-02-15 16:20:41', NULL, NULL, '', 4);
INSERT INTO `report_job` (`report_job_id`, `company_id`, `report_id`, `report_order_id`, `report_job`, `summary`, `printing_queue`, `cycle`, `scheduled_date`, `batch_generated_date`, `bath_end_date`, `filename`, `user_id`) VALUES (3326, 1, 7, 7, 3326, 0, 0, '', '2017-03-13 11:51:26', NULL, NULL, '', 4);
INSERT INTO `report_job` (`report_job_id`, `company_id`, `report_id`, `report_order_id`, `report_job`, `summary`, `printing_queue`, `cycle`, `scheduled_date`, `batch_generated_date`, `bath_end_date`, `filename`, `user_id`) VALUES (3377, 1, 7, 7, 3377, 0, 0, '', '2017-12-18 11:43:26', NULL, NULL, '', 3);
INSERT INTO `report_job` (`report_job_id`, `company_id`, `report_id`, `report_order_id`, `report_job`, `summary`, `printing_queue`, `cycle`, `scheduled_date`, `batch_generated_date`, `bath_end_date`, `filename`, `user_id`) VALUES (3457, 1, 8, 8, 3457, 0, 0, '', '2019-02-11 13:18:29', NULL, NULL, '', 4);
INSERT INTO `report_job` (`report_job_id`, `company_id`, `report_id`, `report_order_id`, `report_job`, `summary`, `printing_queue`, `cycle`, `scheduled_date`, `batch_generated_date`, `bath_end_date`, `filename`, `user_id`) VALUES (3472, 1, 7, 7, 3472, 0, 0, '', '2019-02-18 13:18:45', NULL, NULL, '', 4);
INSERT INTO `report_job` (`report_job_id`, `company_id`, `report_id`, `report_order_id`, `report_job`, `summary`, `printing_queue`, `cycle`, `scheduled_date`, `batch_generated_date`, `bath_end_date`, `filename`, `user_id`) VALUES (3473, 1, 7, 7, 3473, 0, 0, '', '2019-02-18 13:19:17', NULL, NULL, '', 4);
INSERT INTO `report_job` (`report_job_id`, `company_id`, `report_id`, `report_order_id`, `report_job`, `summary`, `printing_queue`, `cycle`, `scheduled_date`, `batch_generated_date`, `bath_end_date`, `filename`, `user_id`) VALUES (3474, 1, 7, 7, 3474, 0, 0, '', '2019-02-18 13:19:35', NULL, NULL, '', 4);
INSERT INTO `report_job` (`report_job_id`, `company_id`, `report_id`, `report_order_id`, `report_job`, `summary`, `printing_queue`, `cycle`, `scheduled_date`, `batch_generated_date`, `bath_end_date`, `filename`, `user_id`) VALUES (3488, 1, 7, 7, 3488, 0, 0, '', '2019-06-18 12:56:39', NULL, NULL, '', 4);
INSERT INTO `report_job` (`report_job_id`, `company_id`, `report_id`, `report_order_id`, `report_job`, `summary`, `printing_queue`, `cycle`, `scheduled_date`, `batch_generated_date`, `bath_end_date`, `filename`, `user_id`) VALUES (3537, 1, 7, 7, 3537, 0, 0, '', '2020-03-24 13:27:05', NULL, NULL, '', 4);
# 20 records
COMMIT;